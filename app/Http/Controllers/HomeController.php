<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Publicacione;

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

    public function home(){
       
        $publicaciones = Publicacione::with('user','comentarios')
        ->orderBy('id','desc')
        ->get();

        //$rutaImagen = url('storage/');
        $rutaImagen = env('APP_URL').'/proyecto_app/public/storage';

        return ['publicaciones'=>$publicaciones,'rutaImagen'=>$rutaImagen];
        
    }

    public function hola(){
        echo "HOLA";
    }
}
