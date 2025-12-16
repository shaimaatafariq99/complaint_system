<?php
namespace App\Repositories;

use App\Models\Complaint;

class ComplaintRepository {
    protected $model;

    public function __construct(Complaint $complaint) {
        $this->model = $complaint;
    }

    public function all() {
        return $this->model->with('user','status','priority')->get();
    }

    public function find($id) {
        return $this->model->with('user','status','priority')->find($id);
    }

    public function create(array $data) {
        return $this->model->create($data);
    }

    public function update($id, array $data) {
        $complaint = $this->find($id);
        if($complaint) $complaint->update($data);
        return $complaint;
    }

    public function delete($id) {
        $complaint = $this->find($id);
        if($complaint) return $complaint->delete();
        return false;
    }
    public function lockComplaint($complaintId, $userId)
    {
        return Complaint::where('id', $complaintId)->update([
            'locked_by' => $userId,
            'locked_at' => Carbon::now(),
            'lock_expire_at' => Carbon::now()->addMinutes(10) // مدة القفل
        ]);
    }

    public function unlockComplaint($complaintId)
    {
        return Complaint::where('id', $complaintId)->update([
            'locked_by' => null,
            'locked_at' => null,
            'lock_expire_at' => null
        ]);
    }
}