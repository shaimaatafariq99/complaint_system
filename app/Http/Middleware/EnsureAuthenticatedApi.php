<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class EnsureAuthenticatedApi
{
    public function handle(Request $request, Closure $next): Response
    {
        // التحقق باستخدام الـ guard الخاص بالـ API فقط
        if (!Auth::guard('api')->check()) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }
        
        return $next($request);
    }
}
