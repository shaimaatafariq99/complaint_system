<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Complaint extends Model
{
    use HasFactory;
    protected $fillable = [
    'title',
    'description',
    'category_id',
    'user_id',
    'priority_id', 
    'status_id',
    'locked_by',
    'status_locked',
    'assigned_to'
        
    ];
    public function user() {
        return $this->belongsTo(User::class);
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function priority() {
        return $this->belongsTo(Priority::class);
    }

    public function status() {
        return $this->belongsTo(Status::class);
    }

    public function replies() {
        return $this->hasMany(ComplaintReply::class);
    }

    public function assignedStaff() {
        return $this->belongsTo(User::class, 'assigned_to');
    }
}
