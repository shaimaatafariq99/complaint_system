<?php
namespace App\Repositories;

use App\Models\Category;

class CategoryRepository {
    public function all() {
        return Category::all();
    }

    public function find($id) {
        return Category::find($id);
    }

    public function create($data) {
        return Category::create($data);
    }

    public function update($id, $data) {
        $category = $this->find($id);
        if($category) {
            $category->update($data);
            return $category;
        }
        return null;
    }

    public function delete($id) {
        $category = $this->find($id);
        if($category) {
            $category->delete();
            return true;
        }
        return false;
    }
}