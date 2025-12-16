<?php

namespace App\Http\Controllers;

use App\Services\CategoryService;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    protected $categoryService;

    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    // Create category
    public function store(Request $request)
    {
        return response()->json($this->categoryService->createCategory($request->all()));
    }

    // Get all categories
    public function index()
    {
        return response()->json($this->categoryService->getAllCategories());
    }

    // Get single category
    public function show($id)
    {
        return response()->json($this->categoryService->getCategory($id));
    }

    // Update category
    public function update(Request $request, $id)
    {
        return response()->json($this->categoryService->updateCategory($id, $request->all()));
    }

    // Delete category
    public function destroy($id)
    {
        return response()->json($this->categoryService->deleteCategory($id));
    }
}
