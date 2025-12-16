<?php

namespace App\Services;

use App\Models\Complaint;

class NotificationService
{
    public function sendComplaintStatusNotification(Complaint $complaint)
    {
        $user = $complaint->user;

        if (!$user || !$user->fcm_token) return false;

        $payload = [
            'title' => 'تحديث حالة الشكوى',
            'body' => 'تم تحديث حالة الشكوى رقم ' . $complaint->id . ' إلى ' . $complaint->status,
            'data' => [
                'complaint_id' => $complaint->id,
                'status' => $complaint->status
            ]
        ];

        // إرسال Event للـ Front-end
        event(new \App\Events\ComplaintStatusUpdated($user, $payload));

        return true;
    }
}
