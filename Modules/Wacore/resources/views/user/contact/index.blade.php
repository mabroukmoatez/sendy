@extends('layouts.main.app')
@section('head')
{{-- Main page header with primary contact management buttons --}}
@include('layouts.main.headersection',[
'title' => __('Contact List'),
'buttons' =>[
	[
		'name'=>__('Create Contact'),
		'url'=> route('user.contact.create'),
	],
    [
        'name'=>__('Import From File'),
        'url'=>'#',
        'components'=>'data-toggle="modal" data-target="#import-contact"',
        'is_button'=>true
    ],
    [
        'name'=>__('Import From Device'),
        'url'=>'#',
        'components'=>'data-toggle="modal" data-target="#import-from-device-modal"',
        'is_button'=>true
    ],
    [
		'name'=>__('Groups'),
		'url'=> route('user.group.index'),
	]
]])
@endsection
@push('topcss')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/select2/dist/css/select2.min.css') }}">
@endpush
@section('content')
<div class="row justify-content-center">
	<div class="col-12">
		<div class="row d-flex justify-content-between flex-wrap">
			{{-- Stats Cards --}}
			<div class="col">
				<div class="card card-stats">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<span class="h2 font-weight-bold mb-0">{{ $total_contacts }}</span>
							</div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-primary text-white rounded-circle shadow">
									<i class="fi fi-rs-address-book mt-2"></i>
								</div>
							</div>
						</div>
						<p class="mt-3 mb-0 text-sm"></p>
                        <h5 class="card-title text-muted mb-0">{{ __('Total des contacts') }}</h5>
						<p></p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-stats">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<span class="h2 font-weight-bold mb-0">{{ $limit }}</span>
							</div>
							<div class="col-auto">
								<div class="icon icon-shape bg-gradient-primary text-white rounded-circle shadow">
									<i class="fas fa-signal"></i>
								</div>
							</div>
						</div>
						<p class="mt-3 mb-0 text-sm"></p>
                        <h5 class="card-title text-muted mb-0">{{ __('Contacts statics') }}</h5>
						<p></p>
					</div>
				</div>
			</div>
		</div>

		@if(count($contacts ?? []) > 0)
		<div class="card">
			<div class="card-body">
                {{-- Table Card Header with contextual action buttons --}}
                <div class="text-right mb-3">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#change-group-modal" id="change-group-btn" disabled>
                        <i class="fas fa-users mr-1"></i> {{ __('Change Group') }}
                    </button>
                    <button class="btn btn-success" data-toggle="modal" data-target="#send-template-bulk">
                        <i class="ni ni-send mr-1"></i> {{ __('Send Bulk Template') }}
                    </button>
                </div>

				<div class="row">
					<div class="col-sm-12 table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col" style="width: 5%;">
										<div class="custom-control custom-checkbox">
											<input class="custom-control-input" id="select-all" type="checkbox">
											<label class="custom-control-label" for="select-all"></label>
										</div>
									</th>
									<th scope="col" style="width: 25%;">{{ __('Contact Name') }}</th>
									<th scope="col" style="width: 30%;">{{ __('Group') }}</th>
									<th scope="col" style="width: 20%;" class="text-right">{{ __('Whatsapp Number') }}</th>
									<th scope="col" style="width: 20%;" class="text-right">{{ __('Action') }}</th>
								</tr>
							</thead>
							<tbody class="tbody">
								@foreach($contacts ?? [] as $contact)
								<tr>
									<td>
										<div class="custom-control custom-checkbox">
											<input class="custom-control-input contact-checkbox" id="contact-{{ $contact->id }}" type="checkbox" value="{{ $contact->id }}">
											<label class="custom-control-label" for="contact-{{ $contact->id }}"></label>
										</div>
									</td>
									<td>{{ $contact->name }}</td>
									<td>
										@foreach($contact->groupcontact as $groupcontact)
										<span class="badge badge-primary">{{ $groupcontact->name }}</span>
										@endforeach
									</td>
									<td class="text-right">{{ $contact->phone }}</td>
									<td>
										<div class="btn-group mb-2 float-right">
											<button class="btn btn-neutral btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												{{ __('Action') }}
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item has-icon edit-contact" href="#" 
												data-action="{{ route('user.contact.update',$contact->id) }}" 
												data-name="{{ $contact->name }}"  
												data-phone="{{ $contact->phone }}"
												data-groupid="{{ $contact->groupcontact[0]->id ?? '' }}"
												data-toggle="modal" 
												data-target="#editModal">
												<i class="ni ni-align-left-2"></i>{{ __('Edit') }}</a>
												<a class="dropdown-item has-icon delete-confirm" href="javascript:void(0)" data-action="{{ route('user.contact.destroy',$contact->id) }}"><i class="fas fa-trash"></i>{{ __('Remove Number') }}</a>
											</div>
										</div>
									</td>
								</tr>
								@endforeach
							</tbody>
						</table>
						<div class="d-flex justify-content-center">{{ $contacts->links('vendor.pagination.bootstrap-4') }}</div>
					</div>
				</div>
			</div>
		</div>
		@else
		<div class="alert bg-gradient-primary text-white"><span class="text-left">{{ __('Opps There Is No Contact Found....') }}</span></div>
		@endif
	</div>
</div>

{{-- All Modals (Edit, Import, etc.) --}}
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form type="POST" action="" class="edit-modal ajaxform_instant_reload">
				@csrf
				@method('PUT')
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">{{ __('Edit Contact') }}</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>{{ __('User Name') }}</label>
						<input type="text" name="name" id="user_name" placeholder="Jhone Doe" maxlength="50" class="form-control" required="">
					</div>
					<div class="form-group">
						<label>{{ __('Whatsapp Number') }}</label>
						<input type="number" name="phone" id="user_phone" placeholder="{{ __('Entrer le numéro de téléphone WhatsApp') }}" maxlength="15" class="form-control">
					</div>
					<div class="form-group">
						<label>{{ __('Select Group') }}</label>
						<select name="group" class="form-control" id="group-list">
							@foreach($groups as $group)
							<option value="{{ $group->id }}">{{ $group->name }}</option>
							@endforeach
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
					<button type="submit" class="btn btn-primary submit-btn">{{ __('Save changes') }}</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="import-contact" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form type="POST" action="{{ route('user.contact.import') }}" class="ajaxform_instant_reload" enctype="multipart/form-data">
				@csrf
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">{{ __('Import Contact') }}</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>{{ __('Select CSV') }} <a href="{{ asset('uploads/demo-contact.csv') }}" download="">{{ __('(Download Sample)')  }}</a></label>
						<input type="file" accept=".csv" name="file"  class="form-control" required="">
					</div>	
					<div class="form-group">
						<label>{{ __('Select Group') }}</label>
						<select name="group" class="form-control" >
							@foreach($groups as $group)
							<option value="{{ $group->id }}">{{ $group->name }}</option>
							@endforeach
						</select>
					</div>									
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
					<button type="submit" class="btn btn-primary submit-btn">{{ __('Import') }}</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="import-from-device-modal" tabindex="-1" aria-labelledby="importFromDeviceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form type="POST" action="{{ route('user.contact.import-from-device') }}" class="ajaxform_instant_reload">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="importFromDeviceModalLabel">{{ __('Import Contacts From Device') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="device_id" class="form-label">{{ __('Sélectionner un numéro') }}</label>
                        <select class="form-control @error('device_id') is-invalid @enderror" id="device_id" name="device_id" required>
                            <option value="">-- {{ __('Choose a device') }} --</option>
                            @foreach ($devices as $device)
                                <option value="{{ $device->id }}">{{ $device->name }} ({{ $device->phone }})</option>
                            @endforeach
                        </select>
                        @error('device_id')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    @if ($devices->isEmpty())
                        <div class="alert alert-warning text-center">
                            {{ __('You don\'t have any active devices connected yet. Please connect a device first.') }}
                            <br>
                            <a href="{{ route('user.device.index') }}" class="btn btn-sm btn-info mt-2">{{ __('Go to Devices') }}</a>
                        </div>
                    @endif
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                    <button type="submit" class="btn btn-primary submit-btn">{{ __('Import Contacts') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="send-template-bulk" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
	<div class="modal-dialog">
		@if(count($templates) > 0 && count($contacts) > 0)
		<div class="modal-content">
			<form type="POST" action="{{ route('user.contact.send-template-bulk') }}" class="ajaxform bulk_send_form">
				@csrf
				<input type="hidden" name="page_url" value="{{ url()->full() }}">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">{{ __('Send Bulk Message With Template') }}</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>{{ __('Sélectionner un modèle') }}</label>
						<select  class="form-control" name="template">
							@foreach($templates as $template)
								<option value="{{ $template->id }}">{{ $template->title }}</option>
							@endforeach
						</select>
					</div>
					<div class="form-group">
						<label>{{ __('Sélectionner un numéro') }}</label>
						<select  class="form-control" name="device">
							@foreach($devices as $device)
								<option value="{{ $device->id }}">{{ $device->name }} - {{ $device->phone }}</option>
							@endforeach
						</select>
					</div>
					<div class="form-group receivers">
						<label>{{ __('Select Receivers') }}</label>
						<select  class="form-control select2" name="contacts[]" multiple="">
							@foreach($contacts as $conatct)
								<option value="{{ $conatct->id }}">({{ $conatct->name }}) - {{ $conatct->phone }}</option>
							@endforeach
						</select>
					</div>
					<div class="form-group d-flex">
						<label class="custom-toggle custom-toggle-primary">
							<input type="checkbox"  name="sentall" id="plain-text"  data-target=".plain-title" class="save-template">
							<span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
						</label>
						<label class="mt-1 ml-1" for="plain-text"><h4>{{ __('Sent this template to all user?') }}</h4></label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-neutral submit-btn float-right">{{ __('Sent Now') }}</button>
				</div>
			</form>
		</div>
		@else
		<div class="alert  bg-gradient-primary text-white"><span class="text-left">{{ __('Create some template and contacts') }}</span></div>
		@endif
	</div>
</div>

<div class="modal fade" id="change-group-modal" tabindex="-1" aria-labelledby="changeGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="change-group-form" action="{{ route('user.contact.bulk.group.change') }}" method="POST" class="ajaxform_instant_reload">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="changeGroupModalLabel">{{ __('Change Contact Group') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="new_group_id">{{ __('Select New Group') }}</label>
                        <select name="new_group_id" id="new_group_id" class="form-control" required>
                            @foreach($groups as $group)
                            <option value="{{ $group->id }}">{{ $group->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div id="selected-contacts-container"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                    <button type="submit" class="btn btn-primary submit-btn">{{ __('Update Group') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('topjs')
<script src="{{ asset('assets/vendor/select2/dist/js/select2.min.js') }}"></script>
@endpush

@push('js')
<script src="{{ asset('assets/js/pages/user/contact.js?V=1') }}"></script>
<script>
$(document).ready(function() {
    // Function to enable/disable the 'Change Group' button
    function toggleChangeGroupButton() {
        if ($('.contact-checkbox:checked').length > 0) {
            $('#change-group-btn').prop('disabled', false);
        } else {
            $('#change-group-btn').prop('disabled', true);
        }
    }

    // Logic for the 'select all' checkbox
    $('#select-all').on('click', function() {
        $('.contact-checkbox').prop('checked', $(this).prop('checked'));
        toggleChangeGroupButton();
    });

    // Logic for individual contact checkboxes
    $('.contact-checkbox').on('change', function() {
        if ($('.contact-checkbox:checked').length === $('.contact-checkbox').length) {
            $('#select-all').prop('checked', true);
        } else {
            $('#select-all').prop('checked', false);
        }
        toggleChangeGroupButton();
    });

    // When the 'Change Group' modal is about to be shown, populate it with selected IDs
    $('#change-group-modal').on('show.bs.modal', function () {
        $('#selected-contacts-container').empty();
        var checkedContacts = $('.contact-checkbox:checked');
        checkedContacts.each(function() {
            $('#selected-contacts-container').append(
                $('<input>').attr({
                    type: 'hidden',
                    name: 'contact_ids[]',
                    value: $(this).val()
                })
            );
        });
    });

    // When the 'Send Bulk' modal is opened, pre-select the chosen contacts
    $('#send-template-bulk').on('show.bs.modal', function () {
        var selectedContactIds = [];
        // If any contacts are checked, use them. Otherwise, the modal will be empty.
        $('.contact-checkbox:checked').each(function() {
            selectedContactIds.push($(this).val());
        });
        // This assumes you are using Select2 for the receivers dropdown
        $('#send-template-bulk .receivers .select2').val(selectedContactIds).trigger('change');
    });

    // Initial check when the page loads to set the button state
    toggleChangeGroupButton();
});
</script>
@endpush
