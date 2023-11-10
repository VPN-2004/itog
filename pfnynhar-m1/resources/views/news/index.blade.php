@extends('layouts.app')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


@section('content')
@foreach($news as $item)
<div class="card text-center">
  <div class="card-header">
  {{ $item->tipe }}
  </div>
  <div class="card-body">
    <h5 class="card-title">{{ $item->title }}</h5>
    <p class="card-text"> {{ $item->content }}</p>
    <a class="btn btn-primary mt-2" href="newspage?id={{$item->id}}">Подробнее</a>
    @if(Auth::user())
        @if((Auth::user()->isAdmin))
        <a href="{{ route('newsedit', $item->id) }}">Редактировать</a>
        @endif
    @endif
    
  </div>
  <div class="card-footer text-muted">
  {{ $item->date }}
  </div>
</div>
 


@endforeach
{{ $news->links() }}
@endsection