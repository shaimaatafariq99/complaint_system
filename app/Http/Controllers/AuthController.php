<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User; // **[تأكد من استيراد موديل المستخدم]**

class AuthController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * Register
     */
    public function register(Request $request)
    {
        $data = $request->all();
        $data['password'] = Hash::make($data['password']);

        $user = $this->userService->registerUser($data);
        $token = $user->createToken('authToken')->accessToken;

        return response()->json([
            'user' => $user,
            'token' => $token
        ]);
    }

    /**
     * Login (تم التعديل ليتوافق مع Passport)
     */
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        // 1. البحث عن المستخدم يدوياً
        $user = User::where('email', $credentials['email'])->first();

        // 2. التحقق من وجود المستخدم وصحة كلمة المرور باستخدام Hash::check()
        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json(['error' => 'Invalid credentials'], 401);
        }

        // 3. إذا كانت البيانات صحيحة، إنشاء التوكن
        // لا حاجة لـ Auth::attempt() بعد الآن
        $token = $user->createToken('authToken')->accessToken;

        return response()->json([
            'user' => $user,
            'token' => $token
        ]);
    }

    /**
     * Get authenticated user
     */
    public function me(Request $request)
    {
        return response()->json($request->user());
    }

    public function verifyOtp(Request $request)
    {
        $userId = $request->input('user_id');
        $otp = $request->input('otp');

        if ($this->userService->verifyOtp($userId, $otp)) {
            $user = $this->userService->getUser($userId);
            $token = $user->createToken('authToken')->accessToken;

            return response()->json([
                'message' => 'OTP Verified',
                'token' => $token
            ]);
        }

        return response()->json(['error' => 'Invalid or expired OTP'], 400);
    }
    
    // **[تمت إضافة دالة Logout التي فقدناها سابقاً]**
    public function logout(Request $request)
    {
        $user = $request->user();
        if ($user) {
            $user->token()->revoke();
            return response()->json(['status' => 'success', 'message' => 'Successfully logged out']);
        }
        return response()->json(['error' => 'User not authenticated'], 401);
    }

    /**
     * Update FCM token
     */
    public function updateFcmToken(Request $request)
    {
        $request->validate([
            'fcm_token' => 'required|string',
        ]);

        $user = $request->user();
        $user->fcm_token = $request->fcm_token;
        $user->save();

        return response()->json(['status' => 'success', 'message' => 'FCM token updated']);
    }
}
