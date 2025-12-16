<?php
namespace App\Services;

use App\Repositories\ComplaintRepository;
use App\Repositories\UserRepository;
use App\Services\ActivityService;
use App\Repositories\PriorityRepository;
use App\Repositories\StatusRepository; 
use Carbon\Carbon; // تأكد من استيراد Carbon لدوال القفل

class ComplaintService {
    protected $complaintRepo;
    protected $userRepo;
    protected $activityService;
    protected $priorityRepo; 
    protected $statusRepo; 
    protected $repo; // مستخدم في دوال القفل

    public function __construct(
        ComplaintRepository $complaintRepo, 
        UserRepository $userRepo,
        ActivityService $activityService,
        PriorityRepository $priorityRepo, 
        StatusRepository $statusRepo
    ) {
        $this->complaintRepo = $complaintRepo;
        $this->userRepo = $userRepo;
        $this->activityService = $activityService;
        $this->priorityRepo = $priorityRepo; 
        $this->statusRepo = $statusRepo;
        $this->repo = $complaintRepo; // تعيين repo هنا
    }

    public function changeComplaintStatus($complaintId, $state)
    {
        $complaint = $this->complaintRepo->find($complaintId);
        if (!$complaint) return null;
    
        // --- التحقق من القفل ---
        if ($complaint->status_locked && $complaint->locked_by != auth()->id()) {
            throw new \Exception("هذه الشكوى قيد المعالجة من موظف آخر.");
        }
    
        // وضع القفل
        $complaint->status_locked = true;
        $complaint->locked_by = auth()->id();
        $complaint->save();
    
        // حفظ البيانات القديمة
        $oldData = $complaint->toArray();
    
        // تغيير الحالة
        $state->handle($complaint);
        $complaint->save();
    
        // تسجيل النشاط
        $this->activityService->log(
            'update',
            'Complaint',
            $oldData,
            $complaint->toArray()
        );
    
        // --- إرسال Notification ---
        // تأكد من حقن notificationService في الـ constructor إذا كنت تستخدم هذا السطر
        // if ($complaint->user && $complaint->user->fcm_token) {
        //     $this->notificationService->sendComplaintStatusNotification($complaint);
        // }
    
        // تحرير القفل
        $complaint->status_locked = false;
        $complaint->locked_by = null;
        $complaint->save();
    
        return $complaint;
    }
    
    public function getComplaint($id) {
        return $this->complaintRepo->find($id);
    }

    public function getAllComplaints() {
        return $this->complaintRepo->all();
    }
    
    public function lockIfPossible($complaintId, $userId)
    {
        $complaint = $this->repo->find($complaintId);
        if ($complaint->lock_expire_at && Carbon::now()->gt($complaint->lock_expire_at)) {
            $this->repo->unlockComplaint($complaintId);
        }
        if ($complaint->locked_by && $complaint->locked_by != $userId) {
            return [
                'locked' => true,
                'locked_by' => $complaint->locked_by,
                'message' => 'هذه الشكوى قيد المعالجة من مستخدم آخر'
            ];
        }

        $this->repo->lockComplaint($complaintId, $userId);

        return ['locked' => false];
    }

    public function unlock($complaintId)
    {
        return $this->repo->unlockComplaint($complaintId);
    }
    
    public function createComplaint(array $data)
    {
        $priority = $this->priorityRepo->findByName('Low');
        $data['priority_id'] = $priority ? $priority->id : 1; 
        $status = $this->statusRepo->findByName('new'); 
        $data['status_id'] = $status ? $status->id : 1;
        if (!isset($data['assigned_to'])) {
            $data['assigned_to'] = null; 
        }
        $complaint = $this->complaintRepo->create($data);

        $this->activityService->log(
            'create',
            'Complaint',
            [], 
            $complaint->toArray()
        );

        return $complaint;
    }

    public function updateComplaint($id, array $data)
{
    $complaint = $this->complaintRepo->find($id);
    if (!$complaint) {
        throw new \Exception("Complaint not found.");
    }

    $oldData = $complaint->toArray();

    if (isset($data['status'])) {
        $statusName = $data['status'];
        $statusObject = $this->statusRepo->findByName($statusName); 
        
        if (!$statusObject) {
            throw new \Exception("Status name '{$statusName}' not found.");
        }

        $data['status_id'] = $statusObject->id;
        unset($data['status']);
    }

    // تنفيذ التحديث
    $this->complaintRepo->update($id, $data);

    // إعادة تحميل الشكوى بعد التحديث
    $complaint = $this->complaintRepo->find($id);

    // تسجيل النشاط
    $this->activityService->log(
        'update',
        'Complaint',
        $oldData,
        $complaint->toArray()
    );

    return $complaint;
}


    

}
