<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Publicacione;
use App\Models\Reaccione;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function home(Request $request){
       
        $publicaciones = Publicacione::with('user','comentarios','likes')
        ->orderBy('id','desc')
        ->get();

        //$rutaImagen = url('storage/');
        $rutaImagen = env('APP_URL').'/proyecto_app/public/storage';

        $mis_likes = Reaccione::where('id_user', $request->id_user)->get();

        return ['publicaciones'=>$publicaciones,'rutaImagen'=>$rutaImagen,'mis_likes'=>$mis_likes];
        
    }

    public function hola(){
        echo "HOLA";
    }
}
