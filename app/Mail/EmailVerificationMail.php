<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class EmailVerificationMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $link;

    public function __construct($link)
    {
        $this->link = $link;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Email Verification Mail',
        );
    }

    public function content(): Content
    {
        return new Content(
            markdown: 'emails.mail-verification',
            with: [
                'link' => $this->link,
            ],
        );
    }

    public function attachments(): array
    {
        return [];
    }
}/*
$emailVerify = EmailVerify::updateOrCreate(
    ['email' => $user['email']] ,
    [
        'token' => Str::random(255),
        'expired_at' => Carbon::now()->addMinutes(5)
    ]
);
Mail::to($user['email'])->send(
    new EmailVerificationMail(route('mail.verify', ['token' => $emailVerify->token]))
);
*/