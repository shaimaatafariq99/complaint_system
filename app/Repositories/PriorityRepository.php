<?php
namespace App\Repositories;

use App\Models\Priority;

class PriorityRepository {
    protected $model;

    public function __construct(Priority $priority) {
        $this->model = $priority;
    }

    public function all() {
        return $this->model->all();
    }
    public function findByName($name) {
        return $this->model->where('level', $name)->first();
    }

    public function find($id) {
        return $this->model->find($id);
    }
}