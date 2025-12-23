<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OTPMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * المتغير العام الذي سيحمل رمز التحقق (OTP).
     * سيكون متاحاً تلقائياً في ملف الـ view.
     */
    public $otp;

    /**
     * Create a new message instance.
     *
     * @param string $otp_code رمز التحقق الذي تم تمريره من UserService
     * @return void
     */
    public function __construct(string $otp_code)
    {
        $this->otp = $otp_code;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'رمز التحقق الخاص بك (OTP) - نظام الشكاوى',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
           
            view: 'emails.otp', 
        );
    }
}