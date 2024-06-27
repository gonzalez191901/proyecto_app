<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
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
        $this->middleware('guest')->except('logout');
    }

        public function logout(Request $request)
    {
        Traza::create_traza('SALIDA', 'AUTENTICACIÓN', 'SALIDA DEL SISTEMA POR EL USUARIO ' . Auth::user()->name);
        $this->guard()->logout();
        $request->session()->invalidate();
        return response()->json(['message' => 'Logout exitoso'], 200);
    }

    protected function attemptLogin(Request $request)
    {
        // Validar que los campos 'name' y 'password' estén presentes en la solicitud
        $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = $request->only('email', 'password');

        // Intentar autenticar al usuario utilizando las credenciales proporcionadas
        if (Auth::attempt($credentials, $request->filled('remember'))) {
            // Autenticación exitosa
            $user = Auth::user();


            return response()->json([
                'status_auth' => 1,
                'user' => $user->id
            ], 200);
        } else {
            // Autenticación fallida
            return response()->json(['error' => 'Credenciales incorrectas.'], 401);
        }
    }
}
