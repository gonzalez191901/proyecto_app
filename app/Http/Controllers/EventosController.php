<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Evento;

class EventosController extends Controller
{
    public function create(Request $request){
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
            $directory = 'uploads/eventos/' . $userId;
    
            // Crear el directorio si no existe
            if (!Storage::exists($directory)) {
                Storage::makeDirectory($directory);
            }
    
            // Guardar el archivo en el directorio correspondiente
            $filePath = $file->storeAs($directory, $fileName, 'public');
    
            // Crear una nuevo evento
            $evento = new Evento();
            $evento->titulo = $request->title;
            $evento->photo = $fileName;
            $evento->descripcion = $request->description;
            $evento->fecha_inicio = $request->startDate;
            $evento->hora_inicio = $request->startTime;
            $evento->fecha_fin = $request->endDate;
            $evento->hora_fin = $request->endTime;
            $evento->id_user = $request->id_user;
    
            // Guardar la publicación en la base de datos
            $evento->save();
    
            // Retornar la ruta del archivo almacenado
            return response()->json(['path' => $filePath], 200);
        }
    
        // Si no se encontró archivo en la solicitud
        return response()->json(['error' => 'No file uploaded'], 400);
    }
}
