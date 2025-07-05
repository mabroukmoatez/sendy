@extends('layouts.main.app')
@section('head')
@include('layouts.main.headersection',['title'=>__('Single Send')])
@endsection
@push('topcss')
     
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/css/uikit.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/select2/dist/css/select2.min.css') }}">
@endpush
@section('content')

<div class="row justify-content-center">
    <div class="col-12">
        <div class="card" style=" height: 83vh; ">
           <div class="card-header d-flex justify-content-between align-items-center"> {{-- Added d-flex, justify-content-between, align-items-center --}}
                <h4 class="text-left" style="font-size: 20px;">{{ __('Message personnalisé envoyé') }} </h4>
                <ul class="nav nav-pills custom-btn-div" id="myTab4" role="tablist"> 
                    <li class="nav-item">
                        <a class="nav-link active btn btn-sm" id="home-tab4" data-toggle="tab" href="#mode_1" role="tab" aria-controls="home" aria-selected="true">{{ __('Texte Unique') }}</a> {{-- Added btn btn-sm --}}
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-sm" id="profile-tab4" data-toggle="tab" href="#mode_2" role="tab" aria-controls="profile" aria-selected="false">{{ __('Texte avec média') }}</a> {{-- Added btn btn-sm --}}
                    </li>
                </ul>
            </div>
            <div class="card-body pl-5 pr-5">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="tab-content no-padding" id="myTab2Content">
                            <div class="tab-pane fade show active" id="mode_1" role="tabpanel" aria-labelledby="home-tab4">
                                <form method="POST" action="{{ route('user.sent.customtext','plain-text') }}" class="ajaxform_reset_form">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6">
                                            
                                                <label>{{ __('Sélectionner un numéro') }}</label>
                                                <select class="form-control" name="device" required="" data-toggle="select">
                                                    @foreach($devices as $device)
                                                    <option value="{{ $device->id }}">{{ $device->name }} (+{{ $device->phone }})</option>
                                                    @endforeach
                                                </select>
                                            
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>{{ __('Message à (Destinataire)') }}</label>
                                                <input id="phone" type="number" class="form-control" name="phone" placeholder="{{ __('Entrer le numéro de téléphone WhatsApp') }}" value="" required="" autofocus="" minlength="8" maxlength="15" />
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>{{ __('Message') }}</label>
                                                <br>
                                               
                                                <textarea id="myTextarea" class="form-control h-200 one mt-1" name="message" required="" maxlength="1000"></textarea>
                                            </div>
                                        </div>
                                     
                                         <div class="col-sm-12 plain-title none">
                                            <div class="form-group">
                                                <label>{{ __('Template Name') }}</label>
                                                <input type="text" name="template_name" class="form-control" >
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12">
                                            <div class="row">
                                             <div class="col-sm-8 d-flex">
                                                <label class="custom-toggle custom-toggle-primary">
                                                    <input type="checkbox"  name="templatestatus" id="plain-text"  data-target=".plain-title" class="save-template">
                                                    <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
                                                </label>
                                                <label class="mt-1 ml-1" for="plain-text"><h4>{{ __('Enregistrer ceci comme modèle ?') }}</h4></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <button type="submit" class="btn btn-whatsapp submit-button float-right">{{ __('Send Message') }}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            </div>
                            <div class="tab-pane fade" id="mode_2" role="tabpanel" aria-labelledby="profile-tab4">
                                <form method="POST" action="{{ route('user.sent.customtext','text-with-media') }}" class="ajaxform_reset_form" enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>{{ __('Sélectionner un numéro') }}</label>
                                                <select class="form-control" name="device" required="">
                                                    @foreach($devices as $device)
                                                    <option value="{{ $device->id }}">{{ $device->name }} (+{{ $device->phone }})</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>{{ __('Message à') }}</label>
                                                <input id="phone" type="number" class="form-control" name="phone" placeholder="{{ __('Entrer le numéro de téléphone WhatsApp') }}" value="" required="" autofocus="" minlength="8" maxlength="15" />
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>{{ __('Sélectionner un fichier (média)') }}</label>
                                                <input id="phone" type="file" class="form-control" name="file" required="" />
                                               <small>{{__(' Type de fichier pris en charge :')}}</small> <small class="text-danger">{{ __('jpg,jpeg,png,webp,pdf,docx,xlsx,csv,txt') }}</small>
                                            </div>
                                            

                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>{{ __('Message') }}</label>
                                                <br>
                                                <textarea id="myTextarea1" class="form-control h-200 one mt-1" name="message" required="" maxlength="1000"></textarea>
                                            </div>
                                        </div>
                                       

                                          <div class="col-sm-12 text-with-file none">
                                            <div class="form-group">
                                                <label>{{ __('Template Name') }}</label>
                                                <input type="text" name="template_name" class="form-control" >
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12">
                                            <div class="row">
                                               <div class="col-sm-8 d-flex">
                                                <label class="custom-toggle custom-toggle-primary">
                                                    <input type="checkbox"  name="templatestatus" id="text-with-file"  data-target=".text-with-file" class="save-template">
                                                    <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
                                                </label>
                                                <label class="mt-1 ml-1" for="text-with-file"><h4>{{ __('Enregistrer ceci comme modèle ?') }}</h4></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <button type="submit" class="btn btn-whatsapp submit-button float-right">{{ __('Send Message') }}</button>
                                            </div>
                                        </div>
                                    </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection
@push('js')
<script src="{{ asset('assets/vendor/select2/dist/js/select2.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/js/uikit-icons.min.js"></script>

<script type="text/javascript" src="{{ asset('assets/js/pages/bulk/template.js') }}"></script>

@endpush