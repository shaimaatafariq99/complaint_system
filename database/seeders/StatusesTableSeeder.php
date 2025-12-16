<?php

// database/seeders/StatusesTableSeeder.php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StatusesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('statuses')->insert([
            ['name' => 'new'],
            ['name' => 'in_progress'],
            ['name' => 'solved'],
            ['name' => 'closed'],
        ]);
    }
}
