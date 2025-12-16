<?php
namespace App\Services;

use App\Repositories\UserRepository;
use Illuminate\Support\Facades\Mail;
use App\Services\ActivityService;
use App\Mail\OTPMail;

class UserService {
    protected $userRepo;
    protected $activityService;

    public function __construct(UserRepository $userRepo, ActivityService $activityService) {
        $this->userRepo = $userRepo;
        $this->activityService = $activityService;
    }

    public function registerUser($data) {
        $user = $this->userRepo->create($data);
        $this->activityService->log('add', 'User', null, $user->toArray());
        $this->sendOTP($user);
        return $user;
    }

    public function getUser($id) {
        return $this->userRepo->find($id);
    }

    public function updateUser($id, $data) {
        $oldData = $this->userRepo->find($id)->toArray();
        $user = $this->userRepo->update($id, $data);
        $this->activityService->log('update', 'User', $oldData, $user->toArray());
        return $user;
    }

    public function deleteUser($id) {
        $oldData = $this->userRepo->find($id)->toArray();
        $this->userRepo->delete($id);
        $this->activityService->log('delete', 'User', $oldData, null);
        return true;
    }

    public function sendOTP($user) {
        $otp = rand(100000, 999999);
        $user->otp = $otp;
        $user->otp_expires_at = now()->addMinutes(5);
        $user->save();

        Mail::to($user->email)->send(new OTPMail($otp));
        $this->activityService->log('send_otp', 'User', null, ['user_id' => $user->id, 'otp' => $otp]);

        return $otp;
    }

    /**
     * Verify OTP: تم تعديل هذه الدالة لتقبل user ID
     */
    public function verifyOTP($userId, $inputOtp) {
        // 1. البحث عن المستخدم باستخدام الـ ID
        $user = $this->userRepo->find($userId);

        if (!$user) {
            return false; // المستخدم غير موجود
        }

        // 2. التحقق من الـ OTP وصلاحيته
        if ((string)$user->otp !== (string)$inputOtp) {
            return false;
        }
        
        if (now()->gt($user->otp_expires_at)) {
            return false; // OTP منتهي الصلاحية
        }

        // 3. تحديث حالة المستخدم (توثيق)
        $user->is_verified = true;
        $user->otp = null;
        $user->otp_expires_at = null;
        $user->save();

        $this->activityService->log('verify_otp', 'User', null, ['user_id' => $user->id]);

        return true; // تم التحقق بنجاح
    }
}
