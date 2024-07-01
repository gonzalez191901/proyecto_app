<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }

    public function createUser(Request $request){

       
        $request->validate([
            'nombre' => 'required|string',
            'apellidos' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'fechaNacimiento' => 'required|string',
            'sexo' => 'required|string',
            //'cedula' => 'required|string',
            'tipoUsuario' => 'required|string',
            'username' => 'required|string|unique:users',
            'password' => 'required|min:8|string',
            'password2' => 'required|same:password',
        ]);


        /*$user = User::create([
            'name' => $request->nombre,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'apellidos' => $request->apellidos,
            'fecha_naci' => $request->fechaNacimiento,
            'sexo' => $request->sexo,
            //'cedula' => $request->cedula,
            'id_rol' => $request->tipoUsuario,
            'username' => $request->email,
        ]);*/
        $user = new User;

        $user->name = $request->nombre;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->apellidos = $request->apellidos;
        $user->fecha_naci = $request->fechaNacimiento;
        $user->sexo = $request->sexo;
        $user->id_rol = $request->tipoUsuario;
        $user->username = $request->username;

        if($user->save()){
            return response()->json([
                'status_auth' => 1,
                'user' => $user
            ], 200);
        }else{
            return response()->json([
                'status_auth' => 0
            ], 500);
        }

    }
}
