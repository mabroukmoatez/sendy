@extends('layouts.main.app')

@section('head')
    {{-- This header section is for the page title. No buttons here as they are now within the card. --}}
    @include('layouts.main.headersection',['title'=>__('Bulk Send Messages')])
@endsection

@push('topcss')
    {{-- Vendor CSS --}}
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/select2/dist/css/select2.min.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.css" integrity="sha512-qveKnGrvOChbSzAdtSs8p69eoLegyh+1hwOMbmpCViIwj7rn4oJjdmMvWOuyQlTOZgTlZA0N2PXA7iA8/2TUYA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    {{-- UIkit CSS (from your single send page ) --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/css/uikit.min.css">
@endpush

@section('content' )

<div class="row justify-content-center">
    <div class="col-12">
        <div class="card">
           <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="text-left" style="font-size: 20px;">{{ __('Envoi en masse') }}</h4>
                {{-- Navigation for different bulk send types --}}
                <ul class="nav nav-pills" id="bulkSendTabs" role="tablist">
                 
                    {{-- The "Messages Log" button could be placed here or remain in the main header if it's a global navigation item --}}
                    {{-- Example if you want it here:
                    <li class="nav-item ml-3">
                        <a class="btn btn-neutral btn-sm" href="{{ url('/user/bulk-message') }}"><i class="fa fa-clipboard-list"></i>&nbsp;{{ __('Messages Log') }}</a>
                    </li>
                    --}}
                </ul>
            </div>
            <div class="card-body pl-5 pr-5"> 
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="tab-content no-padding" id="bulkSendTabContent">
                            <div class="tab-pane fade show active" id="bulk_contact_mode" role="tabpanel" aria-labelledby="bulk-contact-tab">
                                <form class="ajaxform_reset_form" action="{{ route('user.bulk-message.store') }}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>{{ __('Select Number (From)') }}</label>
                                                <select class="form-control" name="device" required="">
                                                    <option value="" disabled="" selected="">{{ __('Sélectionner un numéro') }}</option>
                                                    @foreach($devices as $device)
                                                    <option value="{{ $device->id }}" >{{ $device->name }} (+{{ $device->phone }})</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group receivers-list">
                                                <label>{{ __('Select Receiver Group') }}</label>
                                                <select class="form-control select2" name="group">
                                                    @foreach($groups ?? [] as $group)
                                                    <option value="{{ $group->id }}" data-contacts="{{ $group->contacts }}">{{ $group->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>{{ __('Message') }}</label>
                                                <textarea class="form-control h-200" required="" name="message" maxlength="1000"></textarea>
                                                <span class="text-danger message_alert none">{{ __('Add The Message') }}</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-whatsapp submit-button float-right">{{ __('Send Now') }}</button>
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

{{-- Hidden inputs for JS --}}
<input type="hidden" id="base_url" value="{{ url('/') }}">
<input type="hidden" id="bulk_message_link" value="{{ route('user.bulk-message.store') }}">
@csrf {{-- Ensure CSRF token is available for AJAX forms --}}

@endsection

@push('js')
    {{-- Vendor JS --}}
    <script src="{{ asset('assets/vendor/select2/dist/js/select2.min.js') }}"></script>
    <script src="{{ asset('assets/js/pages/bulk/jquery.csv.min.js') }}" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.js" integrity="sha512-UOJe4paV6hYWBnS0c9GnIRH8PLm2nFK22uhfAvsTIqd3uwnWsVri1OPn5fJYdLtGY3wB11LGHJ4yPU1WFJeBYQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    {{-- UIkit JS (from your single send page ) --}}
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.9.4/dist/js/uikit-icons.min.js"></script>

    {{-- Your custom JS files --}}
    {{-- IMPORTANT: bulkmessage.js and wa-bulk-index.js were likely designed for modals/tables.
        Their internal logic will need to be adapted to work with the new tabbed form structure.
        For example, instead of opening a modal, they might need to switch tabs or directly
        manipulate elements within the active tab. --}}
    <script src="{{ asset('assets/js/pages/bulk/bulkmessage.js' ) }}" ></script>
    {{-- <script src="{{ asset('assets/js/pages/user/wa-bulk-index.js?v=1') }}" ></script> --}} {{-- This one seems to be for transaction history, might not be needed here --}}
    {{-- <script type="text/javascript" src="{{ asset('assets/js/pages/bulk/template.js') }}"></script> --}} {{-- Include if template saving is desired for bulk messages --}}

    <script>
        // Initialize Select2 for all select elements with the 'select2' class
        $(document).ready(function() {
            $('.select2').select2();
        });

        // Add any specific JS needed for the tab functionality if not handled by Bootstrap's data-toggle="tab"
        // For example, if you need to load data dynamically when a tab is shown.
    </script>
@endpush
