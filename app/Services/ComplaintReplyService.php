<?php
namespace App\Services;

use App\Repositories\ComplaintReplyRepository;
use App\Services\ActivityService;

class ComplaintReplyService {
    protected $replyRepo;
    protected $activityService;

    public function __construct(ComplaintReplyRepository $replyRepo, ActivityService $activityService) {
        $this->replyRepo = $replyRepo;
        $this->activityService = $activityService;
    }

    public function addReply($data) {
        $reply = $this->replyRepo->create($data);
        $this->activityService->log('add', 'ComplaintReply', null, $reply->toArray());
        return $reply;
    }

    public function getRepliesByComplaint($complaintId) {
        return $this->replyRepo->all()->where('complaint_id', $complaintId);
    }
}
