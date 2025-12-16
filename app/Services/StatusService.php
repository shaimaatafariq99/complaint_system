<?php
namespace App\Services;

use App\Repositories\StatusRepository;

class StatusService {
    protected $statusRepo;

    public function __construct(StatusRepository $statusRepo) {
        $this->statusRepo = $statusRepo;
    }

    public function getAllStatuses() {
        return $this->statusRepo->all();
    }

    public function getStatus($id) {
        return $this->statusRepo->find($id);
    }
}