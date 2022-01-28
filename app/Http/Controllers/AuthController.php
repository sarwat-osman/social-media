<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use JWTAuth;
use App\User;
use Validator;
use Exception;

class AuthController extends Controller
{
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
    	try {

    		$validator = Validator::make($request->all(), [
	            'first_name' => 'required|string|between:1,100',
	            'last_name' => 'required|string|between:1,100',
	            'email' => 'required|string|email|max:100|unique:users',
	            'password' => 'required|string|min:8',
	        ]);

	        if($validator->fails()){
	            return response()->json(['error' => $validator->errors()->first()], 400);
	        }

	        $userInfo['first_name'] = $request->first_name;
	        $userInfo['last_name'] = $request->last_name;
	        $userInfo['email'] = $request->email;
	        $userInfo['password'] = Hash::make($request->password);

	        $user = User::create($userInfo);
	        if (!$user) {
	            throw new Exception('Registration failed!');
	        }

	        return response()->json(['user' => $user], 201);

    	} catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }        
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request) {
    	try {

    		$validator = Validator::make($request->all(), [
	            'email' => 'required|email',
	            'password' => 'required|string',
	        ]);

	        if ($validator->fails()) {
	            return response()->json(['error' => $validator->errors()->first()], 422);
	        }

	        if (! $token = auth()->attempt($validator->validated())) {
	            return response()->json(['error' => 'Unauthorized!'], 401);
	        }

	        return $this->createNewToken($token);
    	
    	}  catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }    	
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout() {
        auth()->logout();

        return response()->json(['message' => 'User successfully signed out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile() {
        return response()->json(auth()->user());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            // 'token_type' => 'bearer',
            // 'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }

}