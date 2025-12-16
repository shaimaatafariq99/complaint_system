<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;

// راوتات للمشرف فقط (admin)
Route::middleware(['auth:api', 'role:admin'])->group(function () {
    Route::post('/categories', [CategoryController::class, 'store']);      // إنشاء فئة جديدة
    Route::put('/categories/{id}', [CategoryController::class, 'update']); // تعديل فئة موجودة
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy']); // حذف فئة
});

// راوتات للمستخدمين المسجلين فقط
//Route::middleware('auth:api')->group(function () {
    Route::get('/categories', [CategoryController::class, 'index']);   // عرض جميع الفئات
    Route::get('/categories/{id}', [CategoryController::class, 'show']); // عرض فئة واحدة
//});
