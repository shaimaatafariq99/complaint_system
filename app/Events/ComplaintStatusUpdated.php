<?php

namespace App\Events;

use Illuminate\Queue\SerializesModels;
use App\Models\User;

class ComplaintStatusUpdated
{
    use SerializesModels;

    public $user;
    public $payload;

    public function __construct(User $user, array $payload)
    {
        $this->user = $user;
        $this->payload = $payload;
    }
}
