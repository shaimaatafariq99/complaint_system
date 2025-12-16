<?php
namespace App\Repositories;

use App\Models\Status;

class StatusRepository {
    protected $model;

    public function __construct(Status $status) {
        $this->model = $status;
    }

    public function all() {
        return $this->model->all();
    }
    public function findByName($name) {
        return $this->model->where('name', $name)->first();
    }

    public function find($id) {
        return $this->model->find($id);
    }
}