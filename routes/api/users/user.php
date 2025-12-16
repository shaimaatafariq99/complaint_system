<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

Route::middleware(['auth:api', 'role:admin'])->group(function() {
    Route::post('/users', [UserController::class, 'store']);      // إنشاء مستخدم جديد
    Route::put('/users/{id}', [UserController::class, 'update']); // تعديل بيانات المستخدم
    Route::delete('/users/{id}', [UserController::class, 'destroy']); // حذف مستخدم
    Route::get('/users/{id}', [UserController::class, 'show']);   // عرض مستخدم واحد
});
