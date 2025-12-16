<?php
namespace App\Services;

use App\Repositories\CategoryRepository;
use App\Services\ActivityService;

class CategoryService {
    protected $categoryRepo;
    protected $activityService;

    public function __construct(CategoryRepository $categoryRepo, ActivityService $activityService) {
        $this->categoryRepo = $categoryRepo;
        $this->activityService = $activityService;
    }

    public function getAllCategories() {
        return $this->categoryRepo->all();
    }

    public function getCategory($id) {
        return $this->categoryRepo->find($id);
    }

    public function createCategory($data) {
        $category = $this->categoryRepo->create($data);
        $this->activityService->log('add', 'Category', null, $category->toArray());
        return $category;
    }

    public function updateCategory($id, $data) {
        $oldData = $this->categoryRepo->find($id)->toArray();
        $category = $this->categoryRepo->update($id, $data);
        $this->activityService->log('update', 'Category', $oldData, $category->toArray());
        return $category;
    }

    public function deleteCategory($id) {
        $oldData = $this->categoryRepo->find($id)->toArray();
        $this->categoryRepo->delete($id);
        $this->activityService->log('delete', 'Category', $oldData, null);
        return true;
    }
}
