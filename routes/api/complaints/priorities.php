<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PriorityController;

Route::middleware(['auth:api', 'role:employee,admin'])->group(function() {
    Route::get('/priorities', [PriorityController::class, 'getAll']);
});
