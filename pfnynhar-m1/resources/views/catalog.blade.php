@extends('layouts.app')
@section('content')
    <div class="container">
        <h1 class="text-center mb-4">Меню</h1>
        <!-- Фильтры поиска -->
        <div class="d-flex gap-2">
            <div class="card" style="width: 900px;">
                <div class="card-header">Фильтры</div>
            <form class="card-body"  action="">
                <select class="form-select" name="category" onChange="category(this.value)" id="">
                    <?php if (array_key_exists('category', $_GET)) { ?>
                        <option value="0" <?php if($_GET['category'] == '0') {echo "selected";}?>>Категории</option>
                        <option value="1" <?php if($_GET['category'] == '1') {echo "selected";}?>>Консоли</option>
                        <option value="2" <?php if($_GET['category'] == '2') {echo "selected";}?>>Игровые Карточки</option>
                        <option value="3" <?php if($_GET['category'] == '3') {echo "selected";}?>>Аксессуары</option>
                        <option value="4" <?php if($_GET['category'] == '4') {echo "selected";}?>>Игры</option>
                    <?php } else {?>
                        <option value="0" selected>Категории</option>
                        <option value="1" >Консоли</option>
                        <option value="2" >Игровые Карточки</option>
                        <option value="3" >Аксессуары</option>
                        <option value="4" >Игры</option>
                    <?php } ?>


                </select>
               
                <select class="form-select mt-2" name="price" id="">
                    <option value="0">Цена</option>
                    <option value="1">От дешевых к дорогим</option>
                    <option value="2">от дорогих к дешевым</option>
                </select>
                <button class="btn btn-primary mt-2">Показать</button>
                @if(Auth::user())
                    @if((Auth::user()->isAdmin))
                        <a class="btn mt-2 " href="{{url('create')}}">
                            Создать Объявление 
                        </a>
                    @endif
                @endif
            </form>
            
            </div>
            <div class="d-flex gap-2" style="flex-wrap: wrap">
                <!-- Элементы каталога -->
                @foreach($catalog as $item)
                    <div class="card">
                        <img src="{{$item->img}}" class="card-img" style="width: 300px; height: 270px" alt="">
                        <div class="card-body">
                            <div class="card-title">{{$item->title}}</div>
                            <div class="card-text">{{$item->price}} Руб</div>
                            <a class="btn btn-primary mt-2" href="product?id={{$item->id}}">Купить</a>
                            @if(Auth::user())
                                @if((Auth::user()->isAdmin))
                                    <a class="btn mt-2 " href="editing?id={{$item->id}}">
                                        Редактировать
                                    </a>
                                @endif
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
@endsection
