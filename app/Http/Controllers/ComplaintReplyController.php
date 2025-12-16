<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\ComplaintReplyService;

class ComplaintReplyController extends Controller
{
    protected $replyService;

    public function __construct(ComplaintReplyService $replyService)
    {
        $this->replyService = $replyService;
        $this->middleware('auth:api'); // يحمي كل Routes بالمستخدم المسجل
    }

    // إضافة رد
    public function addReply(Request $request)
    {
        $data = $request->only(['complaint_id', 'message']);
        $data['user_id'] = auth()->id(); // ربط الرد بالمستخدم الحالي

        $reply = $this->replyService->addReply($data);

        return response()->json($reply, 201);
    }

    public function getReplies($complaintId)
    {
        $replies = $this->replyService->getRepliesByComplaint($complaintId);
        return response()->json($replies);
    }
}
