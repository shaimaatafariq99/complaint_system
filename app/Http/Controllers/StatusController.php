<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\StatusService;

class StatusController extends Controller
{
    protected $statusService;

    public function __construct(StatusService $statusService)
    {
        $this->statusService = $statusService;
        $this->middleware('auth:api');
    }


    public function index()
    {
        $statuses = $this->statusService->getAllStatuses();
        return response()->json($statuses);
    }


    public function show($id)
    {
        $status = $this->statusService->getStatus($id);
        return response()->json($status);
    }
}
