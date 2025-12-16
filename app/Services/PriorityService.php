<?php
namespace App\Services;

use App\Repositories\PriorityRepository;

class PriorityService {
    protected $priorityRepo;

    public function __construct(PriorityRepository $priorityRepo) {
        $this->priorityRepo = $priorityRepo;
    }

    public function getAllPriorities() {
        return $this->priorityRepo->all();
    }
}