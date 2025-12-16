<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('activity_logs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable(); // من نفذ العملية
            $table->string('action'); // add, update, delete, reply ...
            $table->string('model'); // اسم الجدول أو النموذج
            $table->text('old_data')->nullable(); // البيانات القديمة (JSON)
            $table->text('new_data')->nullable(); // البيانات الجديدة (JSON)
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('activity_logs');
    }
};

