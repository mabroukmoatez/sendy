@extends('layouts.main.app')

@section('head')
@include('layouts.main.headersection',['buttons'=>[

]])
@endsection
@section('content')
<div class="row justify-content-center">
	<div class="col-12">
		<div class="card">
			<div class="card-header row" style="display: flex; justify-content: space-between; align-items: center;">
				<h4 class="text-left col-6" style="font-size: 20px; margin-bottom: 0;">{{ __('Créer un message programmé') }}</h4>
				<ul class="nav nav-pills custom-btn-div">
					<li class="nav-item">
						<a href="{{ route('user.schedule-message.index') }}" class="nav-link btn btn-sm">Statistique</a>
					</li>
				</ul>
			</div>
			<div class="card-body  pl-5 pr-5">
				<form method="POST" action="{{ route('user.schedule-message.store') }}" class="ajaxform_reset_form" enctype="multipart/form-data">
					@csrf
					
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label>{{ __('Nom programmé') }}</label>
								<input type="text" name="title" class="form-control" required="">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>{{ __('Sélectionner un numéro') }}</label>
								<select class="form-control"  name="device" required="">
									@foreach($devices as $device)
									<option value="{{ $device->id }}">{{ $device->phone }}</option>
									@endforeach
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								

								<label>{{ __('Groupe de destinataires') }}</label>								
								
								<select class="form-control select2 "  name="group" >
									@foreach($groups as $group)
									<option value="{{$group->id}}">{{$group->name}} - ({{ $group->contacts_count }} {{ __('Contacts') }})</option>
									@endforeach
								</select>
								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>{{ __('Date et heure de livraison') }}</label>
							<div class="input-group">							

								
								<input type="datetime-local" name="date" class="form-control" required="" min="{{ now()->format('Y-m-d') }}">
								<div class="input-group-append" style="display:none;">
									<select name="timezone" class="form-control" required="">
										<option value="Africa/Tunis" selected="" >Africa/Tunis</option>
									</select>
								</div>						


							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>{{ __('Type de message') }}</label>
								<select class="form-control message_type"  name="message_type" required="">
									<option value="text">{{ __('Text Message') }}</option>
									<option value="template">{{ __('Template Message') }}</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row plain-text">
						<div class="col-sm-12 plain-text">
							<div class="form-group">
								<label>{{ __('Message') }}</label>
								<textarea class="form-control h-200" name="message" required="" maxlength="1000" placeholder="{{ __('Note : {name} écrivez le nom en fonction du destinataire.') }}"></textarea>
							</div>
						</div>
						
					</div>
					<div class="templates-list none">
						<div class="form-group">
							<label>{{ __('Sélectionner un modèle') }}</label>
							<select  class="form-control" name="template">
								@foreach($templates as $template)
								<option value="{{ $template->id }}">{{ $template->title }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 d-flex justify-content-end"> {{-- Added d-flex and justify-content-end --}}
							<button type="submit" class="btn btn-whatsapp submit-button">{{ __('Créer un programme') }}</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>
@endsection
@push('js')

<script src="{{ asset('assets/js/pages/user/schedule-create.js') }}"></script>
@endpush