<?php

namespace App\Http\Controllers;

use App\Models\Complaint; // تأكد من استيراد موديل Complaint
use App\Services\ComplaintService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; // لاستخدام Auth::id()

class ComplaintController extends Controller
{
    protected $complaintService;
    
    public function __construct(ComplaintService $complaintService)
    {
        $this->complaintService = $complaintService;
    }

    public function store(Request $request)
    {
        // 1. التحقق من صحة البيانات
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
        ]);

        // 2. إضافة هوية المستخدم الحالي إلى البيانات
        $data = $request->all();
        $data['user_id'] = Auth::id(); // أو auth()->id() كما استخدمت سابقاً

        return response()->json(
            $this->complaintService->createComplaint($data),
            201 // رد 201 Created عند النجاح
        );
    }

    public function index()
    {
        // هذه الدالة تعرض كل الشكاوى (يجب حمايتها بـ Admin/Employee Role)
        return response()->json(
            $this->complaintService->getAllComplaints()
        );
    }

    // استخدم Model Binding هنا
    public function show(Complaint $complaint)
    {
        // حاول نعمل Lock عند فتح الشكوى
        $lockStatus = $this->complaintService->lockIfPossible($complaint->id, Auth::id());

        if ($lockStatus['locked'] === true) {
            return response()->json([
                'error' => $lockStatus['message'],
                'locked_by' => $lockStatus['locked_by']
            ], 423); // 423 Locked
        }

        // بما أننا استخدمنا Model Binding، يمكننا إرجاع $complaint مباشرة أو استخدام الـ Service
        return response()->json($complaint); 
    }

    // استخدم Model Binding هنا
    public function update(Request $request, Complaint $complaint)
    {
        // تأكد أن الموظف ماسك القفل
        if ($complaint->locked_by !== null && $complaint->locked_by != Auth::id()) {
            return response()->json(['error' => 'You cannot modify this complaint.'], 423);
        }
        
        // أضف التحقق من البيانات المرسلة للتحديث
        $request->validate([
            'status' => 'string|max:50',
            // ... قواعد أخرى
        ]);


        $updated = $this->complaintService->updateComplaint($complaint->id, $request->all());

        // فك القفل بعد التحديث
        $this->complaintService->unlock($complaint->id);

        return response()->json($updated);
    }

    // استخدم Model Binding هنا
    public function destroy(Complaint $complaint)
    {
        if ($complaint->locked_by != Auth::id()) {
            return response()->json(['error' => 'You cannot delete this complaint.'], 423);
        }

        $this->complaintService->deleteComplaint($complaint->id);

        // فك القفل بعد الحذف
        $this->complaintService->unlock($complaint->id);

        return response()->json(['message' => 'Complaint deleted successfully'], 200);
    }
    
}