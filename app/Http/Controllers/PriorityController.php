<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\PriorityService;

class PriorityController extends Controller
{
    protected $priorityService;

    public function __construct(PriorityService $priorityService)
    {
        $this->priorityService = $priorityService;
        $this->middleware('auth:api'); 
    }
    public function getAll()
    {
        $priorities = $this->priorityService->getAllPriorities();
        return response()->json($priorities);
    }
}
