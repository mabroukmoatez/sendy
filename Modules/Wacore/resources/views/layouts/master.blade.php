<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Sendy - {{ config('app.name', 'Sendy') }}</title>

    <meta name="description" content="{{ $description ?? '' }}">
    <meta name="keywords" content="{{ $keywords ?? '' }}">
    <meta name="author" content="{{ $author ?? '' }}">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    {{-- Vite CSS --}}
    {{-- {{ module_vite('build-wacore', 'resources/assets/sass/app.scss') }} --}}
    <style>
         * {
            font-family: 'Poppins', sans-serif !important;
        }
        
        /* Override Bootstrap's default font variables */
        :root {
            --bs-font-sans-serif: 'Poppins', system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
        }
        
        /* Ensure body uses Poppins */
        body {
            font-family: 'Poppins', sans-serif  !important;
            font-weight: 400;
            line-height: 1.6;
        }
    </style>
</head>

<body>
    @yield('content')

    {{-- Vite JS --}}
    {{-- {{ module_vite('build-wacore', 'resources/assets/js/app.js') }} --}}
</body>
