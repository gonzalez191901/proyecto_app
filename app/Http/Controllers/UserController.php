<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function agregar_foto(Request $request){
     
        if ($request->hasFile('file')) {
            // Obtener el archivo y su nombre original
            $file = $request->file('file');
    
            // Obtener el ID del usuario actual (asumiendo que está autenticado)
            $userId = $request->id_user;
    
            // Obtener la fecha y hora actual para formar el nombre del archivo
            $timestamp = now()->format('YmdHis'); // Formato: AñoMesDiaHoraMinutoSegundo
    
            // Generar el nombre único del archivo
            $fileName = $userId . '_' . $timestamp . '.' . $file->getClientOriginalExtension();
    
            // Directorio donde se almacenarán las imágenes por usuario
            $directory = 'uploads/profile';
    
            // Crear el directorio si no existe
            if (!Storage::exists($directory)) {
                Storage::makeDirectory($directory);
            }
    
            // Guardar el archivo en el directorio correspondiente
            $filePath = $file->storeAs($directory, $fileName, 'public');
    
            // Crear una nueva publicación
            $user = User::find($userId);
            $user->photo = $fileName;
            
    
            // Guardar la publicación en la base de datos
            $user->save();
    
            // Retornar la ruta del archivo almacenado
            return response()->json(['path' => $filePath], 200);
        }
    
        // Si no se encontró archivo en la solicitud
        return response()->json(['error' => 'No file uploaded'], 400);
    }

    public function perfil(Request $request){
        
        $username = $request->username;

        $perfil = User::where('username',$username)->first();

        if($perfil){
            //$rutaImagen = asset('storage/');
            $rutaImagen = env('APP_URL').'/proyecto_app/public/storage';

            return response()->json(['perfil' => $perfil,'rutaImagen'=>$rutaImagen], 200);
        }else{
            return response()->json(['error' => 'Perfil no encontrado'], 500);
        }
    }

    public function descripcion(Request $request){
        
        $user = User::find($request->id_user);

        $user->descripcion =  $request->descripcion;
        $user->update();

        return response()->json(['user' => $user], 200);
    }
}
