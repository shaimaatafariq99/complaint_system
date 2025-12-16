<?php
namespace App\Repositories;

use App\Models\ComplaintReply;

class ComplaintReplyRepository {
    protected $model;

    public function __construct(ComplaintReply $reply) {
        $this->model = $reply;
    }

    public function all() {
        return $this->model->with('complaint','user')->get();
    }

    public function find($id) {
        return $this->model->with('complaint','user')->find($id);
    }

    public function create(array $data) {
        return $this->model->create($data);
    }

    public function update($id, array $data) {
        $reply = $this->find($id);
        if($reply) $reply->update($data);
        return $reply;
    }

    public function delete($id) {
        $reply = $this->find($id);
        if($reply) return $reply->delete();
        return false;
    }
}