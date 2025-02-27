<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publicacione extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function comentarios()
    {
        return $this->hasMany(Comentario::class, 'id_publicacion','id');
    }

    public function likes()
    {
        return $this->hasMany(Reaccione::class, 'id_publicacion');
    }
}
