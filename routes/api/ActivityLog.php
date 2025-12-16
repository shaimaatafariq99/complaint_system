<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivityLogController;


Route::middleware(['auth:api', 'role:admin'])->get('/logs', [ActivityLogController::class, 'index']);

