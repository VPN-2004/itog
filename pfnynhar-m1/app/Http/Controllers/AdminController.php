<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index(){
        return view('admin');
    }
    public function add(Request $data){
        $News = new News();
        $News->title = $data->title;
        $News->tipe = $data->tipe;
        $News->content = $data->content;
        $News->fullcontent = $data->fullcontent;
        $News->date = $data->date;
        $News->save();
        return redirect('admin');
    }
    public function del(Request $data){
        DB::table('News')->where('title','=', $data->title)->delete();
        return redirect('admin');
    }

}
