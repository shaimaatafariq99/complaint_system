<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    // Register User
    public function store(Request $request)
    {
        $data = $request->all();
        return response()->json($this->userService->registerUser($data));
    }

    // Get single user
    public function show($id)
    {
        return response()->json($this->userService->getUser($id));
    }

    // Update user
    public function update(Request $request, $id)
    {
        $data = $request->all();
        return response()->json($this->userService->updateUser($id, $data));
    }

    // Delete user
    public function destroy($id)
    {
        return response()->json($this->userService->deleteUser($id));
    }
}
