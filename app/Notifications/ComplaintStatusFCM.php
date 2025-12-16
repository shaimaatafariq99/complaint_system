<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;

class ComplaintStatusFCM extends Notification
{
    protected $complaint;

    public function __construct($complaint)
    {
        $this->complaint = $complaint;
    }

    public function via($notifiable)
    {
        return ['fcm'];
    }

    public function toFcm($notifiable)
    {
        return [
            'to' => $notifiable->fcm_token,
            'notification' => [
                'title' => 'تحديث حالة الشكوى',
                'body' => 'تم تحديث حالة الشكوى رقم ' . $this->complaint->id . ' إلى ' . $this->complaint->status,
            ],
            'data' => [
                'complaint_id' => $this->complaint->id,
                'status' => $this->complaint->status
            ]
        ];
    }
}
