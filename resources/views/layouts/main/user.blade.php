{{-- resources/views/layouts/main/sidebar.blade.php --}}

@php
  $modules =  array_diff(scandir(base_path('Modules')), array('..', '.'));
  $modules_nodes = [];
  foreach($modules as $module){
    if(file_exists(base_path('Modules/'.$module).'/module.json')){
       $modules_path = file_get_contents(base_path('Modules/'.$module).'/module.json');
       $module_json = json_decode($modules_path);
       if($module_json->status == true){
       if(isset($module_json->module_type)){
          if($module_json->module_type == 'features'){
            array_push($modules_nodes, $module_json);
          }
          
      }
     }
    }   
    
  }
  asort($modules_nodes);
 
  $menuItems = [];

  foreach($modules_nodes as $modules_node){
    $menuItems[$modules_node->name] = $modules_node->user_menu;
  } 
@endphp

 @php
 $itemNo = 0;
 @endphp
 @foreach($menuItems as $key => $menuItem)

 @php
 $itemNo = $itemNo+1;

 @endphp

 @if($itemNo > 1 && count($menuItem) > 0)
 <hr class="my-3 mt-2">
 <!-- Heading -->
 <h6 class="navbar-heading p-0 text-muted">{{ __($key) }}</h6>
 @endif


 <ul class="navbar-nav">
  @foreach($menuItem as $item)
    @if(isset($item->children) && count($item->children) > 0)
        @php
            $isParentActive = false;
            foreach ($item->children as $child) {
                if (Request::is($child->request)) {
                    $isParentActive = true;
                    break;
                }
            }
        @endphp
        {{-- Parent menu item with children --}}
        <li class="nav-item">
            <a class="nav-link {{ $isParentActive ? 'active' : '' }}" href="#navbar-{{ Str::slug($item->name) }}" data-toggle="collapse" role="button" aria-expanded="{{ $isParentActive ? 'true' : 'false' }}" aria-controls="navbar-{{ Str::slug($item->name) }}">
                <i class="{{ $item->icon }}"></i>
                <span class="nav-link-text">{{ __($item->name) }}</span>
            </a>
            <div class="collapse {{ $isParentActive ? 'show' : '' }}" id="navbar-{{ Str::slug($item->name) }}">
                <ul class="nav nav-sm flex-column">
                    @foreach($item->children as $child)
                        <li class="nav-item">
                            <a class="nav-link {{ Request::is($child->request) ? 'active' : '' }}" href="{{ $child->route_type  == 'route' ?  route($child->route) : url($child->route) }}">
                                <i class="{{ $child->icon }}"></i> 
                                <span class="nav-link-text">{{ __($child->name) }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </li>
    @else
        {{-- Regular menu item without children --}}
        <li class="nav-item">
            <a class="nav-link {{ Request::is($item->request) ? 'active' : '' }}" href="{{ $item->route_type  == 'route' ?  route($item->route) : url($item->route) }}">
             <i class="{{ $item->icon }}"></i>
              <span class="nav-link-text">{{ __($item->name) }}</span>
            </a>
        </li>
    @endif
  @endforeach
  </ul>
  @endforeach


<!-- Divider -->
<hr class="my-6 mt-6">
<!-- Heading -->
<h6 class="navbar-heading p-0 text-muted">{{ __('Paramètres') }}</h6>
<!-- Navigation -->
<ul class="navbar-nav mb-md-3">
  <li class="nav-item">
    <a class="nav-link {{ Request::is('user/subscription*') ? 'active' : '' }}" href="{{ url('/user/subscription') }}">
      <i class="ni ni-spaceship"></i>
      <span class="nav-link-text">{{ __('Abonnement') }}</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link {{ Request::is('user/support*') ? 'active' : '' }}" href="{{ url('/user/support') }}" >
      <i class="fas fa-headset"></i>
      <span class="nav-link-text">{{ __('Aide et support') }}</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="{{ url('/user/profile') }}">
      <i class="ni ni-settings-gear-65"></i>
      <span class="nav-link-text">{{ __('Paramètres du profil') }}</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link logout-button" href="#" >
      <i class="ni ni-button-power"></i>
      <span class="nav-link-text">{{ __('Déconnexion') }}</span>
    </a>
  </li>
</ul>
