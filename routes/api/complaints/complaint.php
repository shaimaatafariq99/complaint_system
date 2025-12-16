<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ComplaintController;

// مواطن: إضافة شكوى ومتابعة شكاواه
Route::middleware(['auth:api', 'role:citizen'])->group(function() {
    Route::post('/complaints', [ComplaintController::class, 'store']);     // إضافة شكوى
    Route::get('/my-complaints', [ComplaintController::class, 'index']);  // عرض كل شكاوي المواطن
    Route::get('/complaints/{id}', [ComplaintController::class, 'show']); // عرض شكوى واحدة (للمواطن)

});
// موظف: عرض ومعالجة شكاوى الجهة الخاصة بهم
Route::middleware(['auth:api', 'role:employee'])->group(function() {
    Route::get('/department-complaints', [ComplaintController::class, 'index']); // شكاوى الجهة
    Route::put('/complaints/{complaint}', [ComplaintController::class, 'update']);      // تعديل حالة الشكوى
});

// مشرف عام: عرض كل الشكاوى والتحكم الكامل
Route::middleware(['auth:api', 'role:admin'])->group(function() {
    Route::get('/all-complaints', [ComplaintController::class, 'index']); // عرض كل الشكاوى
    Route::delete('/complaints/{id}', [ComplaintController::class, 'destroy']); // حذف أي شكوى
});
