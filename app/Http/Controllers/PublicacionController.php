<?php

namespace App\Http\Controllers;
use App\Models\Publicacione;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Models\Comentario;
use App\Models\Reaccione;

class PublicacionController extends Controller
{
    public function create(Request $request){

        $request->validate([
            
            'description' => 'required'
        ]);
        
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
            $directory = 'uploads/' . $userId;
    
            // Crear el directorio si no existe
            if (!Storage::exists($directory)) {
                Storage::makeDirectory($directory);
            }
    
            // Guardar el archivo en el directorio correspondiente
            $filePath = $file->storeAs($directory, $fileName, 'public');
    
            // Crear una nueva publicación
            $publicacion = new Publicacione();
            $publicacion->photo = $fileName;
            $publicacion->id_user = $userId;
            $publicacion->descripcion = $request->description;
            $publicacion->ruta_imagen = $filePath; // Guardar la ruta completa si es necesario
    
            // Guardar la publicación en la base de datos
            $publicacion->save();
    
            // Retornar la ruta del archivo almacenado
            return response()->json(['path' => $filePath], 200);
        }
    
        // Si no se encontró archivo en la solicitud
        return response()->json(['error' => 'No file uploaded'], 400);
    }

    public function comentarios(Request $request){


        return Comentario::with('user')->where('id_publicacion',$request->id_publicacion)->orderBy('id','desc')->get();
    }

    public function create_comentario(Request $request){

        $model = new Comentario;
        $model->id_usuario = $request->id_user;
        $model->id_publicacion = $request->id_publicacion;
        $model->comentario = $request->comentario;

        $model->save();

        return response()->json($model, 200);
    }

    public function like(Request $request){

        if($request->isLiked == true){

            $verificador = Reaccione::where('id_publicacion', $request->id_publicacion)
            ->where('id_user', $request->id_user)
            ->get();

            if(count($verificador) > 0){
                Reaccione::where('id_publicacion', $request->id_publicacion)
                        ->where('id_user', $request->id_user)
                        ->delete();
            }

            $model = new Reaccione;

            $model->id_publicacion = $request->id_publicacion;
            $model->id_user = $request->id_user;
            $model->save();

            return "Agregado";

        }else{

            Reaccione::where('id_publicacion', $request->id_publicacion)
                        ->where('id_user', $request->id_user)
                        ->delete();

            return "Eliminado";

        }
        
       
    }
}
