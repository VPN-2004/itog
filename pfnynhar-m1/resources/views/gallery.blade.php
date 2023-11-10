@extends('layouts.app')
@section('content')
<div class="container">
@if(Auth::user())
    @if((Auth::user()->isAdmin))
        <a href="dowimage" class="btn btn-warning">Загрузить</a>
    @endif
 @endif
 <form action="{{ route('gallery.index') }}" method="GET">       
    <div class="form-group"><br>           
        <label for="filter">Выберите категорию:</label><br>           
        <select class="form-control" id="filter" name="filter">      
            <option value="">Выберите категорию</option>         
        <!-- Отобразить список категорий, доступных для фильтрации -->               
        @foreach ($categories as $category)                   
        <option value="{{ $category->name }}">{{ $category->name }}</option>               
        @endforeach           
        </select><br>       
        </div><br>       
        <button type="submit" class="btn btn-primary">Фильтровать</button>
    <br>   
</form>
    <div class="d-flex gap-2" id="imageListId" style="flex-wrap: wrap">
        @forelse($images as $image)
        
            
                <div class="card">
                    <img src="{{ asset($image->image) }}" class="card-img" style="width: 300px; height: 270px" alt="" >
                    @if(Auth::check())
                    @if($image->user_id == Auth::user()->id)
                    <div class="card-body">
                        <form action="image/{{ $image->id }}" method="POST">
                            @method('DELETE')
                            @csrf
                            <input type="submit" value="Delete" class="btn btn-danger">
                        </form>
                    </div>
                    @endif
                    @endif
                </div>
 
            @empty
            <h1 class="text-danger">Ничего не загружено</h1>
            @endforelse
    </div>
   
</div>
@endsection