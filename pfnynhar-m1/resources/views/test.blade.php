<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Токен -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Вкусняшка</title>

    <!-- Скрипты -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/slider.js') }}" defer></script>
    <script src="{{ menu_asset('js/app.js') }}"></script>
    <!-- Шрифты -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    
    <!-- Стили -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/slider.css') }}" rel="stylesheet">
    <link rel="shortcut icon" href="../../../public/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="{{ menu_asset('css/app.css') }}">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <!-- Логотип -->
                <a class="navbar-brand" style="width: 130px"  href="{{ url('/') }}">
                    <img style="height: 40px;" src="{{asset('favicon.ico')}}" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Центральное меню -->
                <div class=" collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav ms-auto me-auto">
                        
                        <li class="dd">
                            {{ menu('menuuser') }}
                        </li> 
                             
                    </ul>      

                    <!-- Меню справа -->
                    <ul class="navbar-nav ">
                        @guest
                            {{menu('login')}}   
                        @endguest
                       @if(Auth::user())
                           {{menu('menupolsov')}}
                       @endif
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
</body>
</html>
