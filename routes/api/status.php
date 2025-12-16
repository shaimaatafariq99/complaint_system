<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StatusController;

// جميع المستخدمين المسجلين يمكنهم الوصول لعرض الحالات
Route::middleware(['auth:api'])->group(function() {
    Route::get('/statuses', [StatusController::class, 'index']);      // عرض كل الحالات
    Route::get('/statuses/{id}', [StatusController::class, 'show']); // عرض حالة واحدة
});
