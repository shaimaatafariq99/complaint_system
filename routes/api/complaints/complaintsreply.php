<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ComplaintReplyController;

// مواطن: عرض الردود الخاصة بشكاويه
Route::middleware(['auth:api', 'role:citizen'])->group(function() {
    Route::get('/replies/{complaintId}', [ComplaintReplyController::class, 'getReplies']);
});

// موظف: إضافة ردود على الشكاوى
Route::middleware(['auth:api', 'role:employee'])->group(function() {
    Route::post('/complaint/reply', [ComplaintReplyController::class, 'addReply']);
});
