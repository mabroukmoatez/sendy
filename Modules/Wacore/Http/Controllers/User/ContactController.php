<?php

namespace Modules\Wacore\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;
use App\Models\Template;
use App\Models\Device;
use App\Models\User;
use App\Rules\Phone;
use App\Traits\Whatsapp;
use App\Models\Group;
use App\Models\Groupcontact;
use Auth;
use DB;
use Http;
use Log;
use Session;

class ContactController extends Controller
{
    use Whatsapp;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $total_contacts=Contact::where('user_id',Auth::id())->count();
        $contacts=Contact::where('user_id',Auth::id())->with('groupcontact')->latest()->paginate(20);
        $templates=Template::where('user_id',Auth::id())->where('status',1)->latest()->get();
        $devices=Device::where('user_id',Auth::id())->where('status',1)->latest()->get();
        $limit  = json_decode(Auth::user()->plan);
        $limit = $limit->contact_limit ?? 0;

        if ($limit == '-1') {
            $limit = number_format($total_contacts);
        }
        else{
            $limit = $total_contacts.' / '.$limit;
        }
        
        $groups = Group::where('user_id',Auth::id())->latest()->get();

        return view('wacore::user.contact.index',compact('contacts','total_contacts','templates','devices','limit','groups'));
    }
     /**
     * Import contacts from the selected device via Node.js API.
     * This method will be added to your existing ContactController.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function importContactsFromDevice(Request $request)
    {
        $validated = $request->validate([
            'device_id' => 'required|exists:devices,id',
        ]);

        $user = Auth::user();
        $device = Device::where('user_id', $user->id)
                        ->where('id', $request->device_id)
                        ->first();

        if (!$device) {
            return response()->json([
                'message' => __('Selected device not found or does not belong to you.'),
            ], 404);
        }

        try {
            $nodeAppUrl = env('WA_SERVER_URL');

            $session_id='device_'.$device->id;
            $response = Http::get("{$nodeAppUrl}/chats/contacts", [
                'id' => 'device_' . $device->id,
            ]);
            if ($response->successful()) {
                $contactsData = $response->json();
                if (!isset($contactsData['success']) || !$contactsData['success'] || !isset($contactsData['data']['contacts'])) {
                    Log::error('Node.js API Error (Contact Import - Response Check): ' . json_encode($contactsData));
                    return response()->json([
                        'message' => $contactsData['message'] ?? __('Node.js API returned an error during contact import.'),
                        'error_details' => $contactsData 
                    ], 500);
                }

                $contactsToImport = $contactsData['data']['contacts'];
                $importedCount = 0;

                DB::beginTransaction();
                try {
                    foreach ($contactsToImport as $contactData) {
              
                        $phone = $contactData['id'] ?? null; 
                        $name = $contactData['name'] ?? null;
                        if ($phone) {
                            // Clean phone number: remove @c.us or @g.us
                            $phone = str_replace(['@c.us', '@g.us'], '', $phone);

                            // Find or create a default group for imported contacts, or handle grouping if Node.js provides it
                            $defaultGroupName = 'Imported Contacts';
                            $group = $user->groups()->firstOrCreate(
                                ['name' => $defaultGroupName],
                                ['user_id' => $user->id]
                            );

                            // Check contact limit before saving
                            if (getUserPlanData('contact_limit') == false) {
                                DB::rollBack();
                                return response()->json([
                                    'message' => __('Maximum Contacts Limit Exceeded. Imported some contacts but reached limit.'),
                                ], 401);
                            }

                            $contact = Contact::firstOrNew(
                                ['user_id' => $user->id, 'phone' => $phone],
                                ['name' => $name ?? $phone]
                            );

                            if ($contact->isDirty() || !$contact->exists) {
                                $contact->save();
                                if (!$contact->exists) {
                                    $importedCount++;
                                }
                            }

                            if (!$contact->groupcontact->contains($group->id)) {
                                $contact->groupcontact()->attach($group->id);
                            }
                        }
                    }
                    DB::commit();

                } catch (\Exception $e) {
                    DB::rollBack();
                    Log::error('Error saving imported contacts/groups: ' . $e->getMessage() . ' on line ' . $e->getLine() . ' in ' . $e->getFile());
                    return response()->json([
                        'message' => __('An error occurred while saving imported contacts. Please try again.'),
                    ], 500);
                }

                return response()->json([
                    'message' => __("Successfully imported {$importedCount} new contacts."),
                    'redirect' => route('user.contact.index'),
                ], 200);

            } else {
                Log::error('Failed to fetch contacts from Node.js API: ' . $response->status() . ' - ' . $response->body());
                return response()->json([
                    'message' => __('Failed to retrieve contacts from the device. Please ensure your device is connected and try again.'),
                    'error_details' => $response->json() // This helps debug Node.js specific errors
                ], 500);
            }

        } catch (\Exception $e) {
            Log::error('General error during contact import: ' . $e->getMessage() . ' on line ' . $e->getLine() . ' in ' . $e->getFile());
            return response()->json([
                'message' => __('An unexpected error occurred during import. Please check application logs.'),
            ], 500);
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $groups = Group::where('user_id',Auth::id())->latest()->get();
        return view('wacore::user.contact.create',compact('groups'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (getUserPlanData('contact_limit') == false) {
            return response()->json([
                'message'=>__('Maximum Contacts Limit Exceeded')
            ],401);  
        }
        

        $validated = $request->validate([
            'phone'   => ['required', new Phone],
            'name'=>['required','max:20'], 
        ]);

        $is_exist=Contact::where('user_id',Auth::id())->where('phone',$request->phone)->first();
        if (!empty($is_exist)) {
           return response()->json([
                'message'  => __('Contact already exist..!!'),
                'redirect' =>  route('user.contact.index')
            ], 401);
        }

        if ($request->group) {
            $group = Group::where('user_id',Auth::id())->findorFail($request->group);
        }

        $contact= new Contact;
        $contact->name = $request->name;
        $contact->phone = $request->phone;
        $contact->user_id = Auth::id();
        $contact->save();

        if ($request->group) {
        $contact->groupcontacts()->insert(['group_id'=>$request->group,'contact_id'=>$contact->id]);
        }

        return response()->json([
                    'message' => __('New Contact Created Successfully'),
               ], 200);
    }

    

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $info=Contact::where('user_id',Auth::id())->findorFail($id);
        return view('wacore::user.contact.edit',compact('info'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'phone'   => ['required', new Phone],
            'name'=>['required','max:20'], 
        ]);

        $is_exist=Contact::where('user_id',Auth::id())->where('phone',$request->phone)->where('id','!=',$id)->first();
        if (!empty($is_exist)) {
           return response()->json([
                'message'  => __('Opps this contact number you have already added')
            ], 401);
        }

        $contact=  Contact::where('user_id',Auth::id())->findorFail($id);
        $contact->name = $request->name;
        $contact->phone = $request->phone;
        $contact->user_id = Auth::id();
        $contact->save();

        if ($request->group) {
            $group = Group::where('user_id',Auth::id())->findorFail($request->group);
            $contact->groupcontact()->sync([$request->group]);
        }


        return response()->json([
                    'message' => __('Contact update Successfully'),
                    'redirect' =>  route('user.contact.index')
               ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $contact=Contact::where('user_id',Auth::id())->findorFail($id);
        $contact->delete();

        return response()->json([
            'message'  => __('Contact deleted successfully..!!'),
            'redirect' =>  route('user.contact.index')
        ], 200);
    }

    public function sendtemplateBulk(Request $request)
    {
       
        if (getUserPlanData('messages_limit') == false) {
            return response()->json([
                'message'=>__('Maximum Monthly Messages Limit Exceeded')
            ],401);  
        }

            $validated = $request->validate([
                'template'=>['required'], 
                'group'   => ['required'],
            ]);

            $group = Group::where('user_id',Auth::id())->whereHas('groupcontacts')->findorFail($request->group);
            $device=Device::where('user_id',Auth::id())->where('status',1)->findorFail($request->device);

            return response()->json([
                'message'  => __('Redirecting to bulk sending page'),
                'redirect' =>  url('user/sent-bulk-with-template/'.$request->template.'/'.$group->id.'/'.$device->uuid)
            ], 200);

            
           // $validated = $request->validate([
           //  'group'   => ['required'],
           //  'template'   => ['required'], 
           // ]);

            // $template=Template::where('user_id',Auth::id())->where('status',1)->findorFail($request->template);
            // $device=Device::where('user_id',Auth::id())->where('status',1)->findorFail($request->device);
            // $contacts=Contact::where('user_id',Auth::id())->whereHas('groupcontacts',function($q) use ($request){
            //     return $q->where('group_id',$request->group);
            // })->get();

            // $user=User::where('id',Auth::id())->first();

            // $logs['template_id']=$template->id;

            // foreach ($contacts as $key => $contact) {
            //   if (isset($template->body['text'])) {

            //     $formatText=$this->formatText($template->body['text'],$contact,$user);
            //     $body=$template->body;
            //     $body['text']=$formatText;
            //     $logs['template_id']=$template->id;

            //   }
            //   else{
            //     $body=$template->body;
            //   }


              
            //   $response = $this->messageSend($body,$device->id,$contact->phone,$template->type,true);

            //   if ($response['status'] == 200) {
            //      $logs['user_id']=$user->id;
            //      $logs['device_id']=$device->id;
            //      $logs['from']=$device->phone ?? null;
            //      $logs['to']=$contact->phone;
            //      $logs['type']='bulk-message';

            //      $this->saveLog($logs);
            //   }
            // }
            
            // return response()->json([
            //     'message'  => __('Message Send Successfully'),
            // ], 200);
        
    }


    public function import(Request $request)
    {

        $validated = $request->validate([
            'file'   => 'required|mimes:csv,txt|max:10',
            
        ]);

        if (getUserPlanData('contact_limit') == false) {
            return response()->json([
                'message'=>__('Maximum Contacts Limit Exceeded')
            ],401);  
        }
        else{
            $contact_limit=json_decode(Auth::user()->plan);
            $contact_limit=$contact_limit->contact_limit;
        }


        if ($request->group) {
            $group = Group::where('user_id',Auth::id())->findorFail($request->group);
        }
        

        $file = $request->file('file');

        $insertable=[];

        // Open the CSV file
        if (($handle = fopen($file, 'r')) !== false) {
        // Read the header row
            $header = fgetcsv($handle);

        // Loop through the remaining rows
            while (($data = fgetcsv($handle)) !== false) {
                $row=array(
                    'name'=>$data[0],
                    'phone'=>$data[1]
                ); 
                array_push($insertable, $row);
                
            }
            fclose($handle);
        }

        $count_contacts=count($insertable);

        if ($contact_limit != -1) {
           $old_rows = Contact::where('user_id',Auth::id())->count();

           $available_rows = $contact_limit-$old_rows;
           


           if ($count_contacts > $available_rows) {
                return response()->json([
                    'message'=>__('Maximum '.$available_rows.' records are available only for create contact')
                ],401);  
           }
        }

        DB::beginTransaction();
        try {
            
            $insertableGroups=[];

              foreach ($insertable as $key => $row) {
                 $contact= new Contact;
                 $contact->name=$row['name'];
                 $contact->phone=$row['phone'];
                 $contact->user_id=Auth::id();
                 $contact->save();

                 $contactRow=array(
                    'contact_id'=>$contact->id,
                    'group_id'=>$request->group ?? null
                ); 
                 array_push($insertableGroups, $contactRow);

             }


             if ($request->group) {
                Groupcontact::insert($insertableGroups);
            }

            DB::commit();

        } catch (Throwable $th) {
            DB::rollback();

            return response()->json([
                'message' => $th->getMessage()
            ], 500);
        }

       
        
        return response()->json([
                'message'  => __('Contact list imported successfully'),
            ], 200);


    }

    /**
     * NEW METHOD add 03-07-2025
     * Update the group for multiple contacts at once.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function bulkGroupChange(Request $request)
    {
        $validated = $request->validate([
            'contact_ids'   => 'required|array',
            'contact_ids.*' => 'exists:contacts,id,user_id,' . Auth::id(),
            'new_group_id'  => 'required|exists:groups,id,user_id,' . Auth::id(),
        ]);

        DB::beginTransaction();
        try {
            $contacts = Contact::where('user_id', Auth::id())->whereIn('id', $request->contact_ids)->get();

            foreach ($contacts as $contact) {
                $contact->groupcontact()->sync([$request->new_group_id]);
            }

            DB::commit();

            // The success message is defined here.
            // Your form.js script will read this and display it.
            return response()->json([
                'message'  => __('Selected contacts have been moved to the new group.'),
                'redirect' => route('user.contact.index')
            ], 200);

        } catch (\Throwable $th) {
            DB::rollback();
            return response()->json([
                'message' => __('An error occurred: ') . $th->getMessage()
            ], 500); // Send an error status
        }
    }


    
}
