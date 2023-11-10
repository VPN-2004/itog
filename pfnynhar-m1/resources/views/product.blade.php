@extends('layouts.app')
@section('content')
    <div class="container">
    @if(Auth::user())
        @if((Auth::user()->isAdmin))
        <a href="{{ route('newsedit', $product[0]->id) }}">Редактировать</a>
        @endif
    @endif
        <div class="d-flex gap-5">
            <div class="cart">
                <div class="card-title"> <h2>{{$product[0]->title}}</h2></div>
                <div class="cart-text">{{$product[0]->content}}</div><br>
                <div class="cart-text">{{$product[0]->fullcontent}}</div><br>
                
            </div>

            
        </div>
        <div class="card-footer text-muted">
            {{ $product[0]->date }}
            </div>
    </div>
@endsection
