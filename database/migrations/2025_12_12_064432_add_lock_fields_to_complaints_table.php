<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('complaints', function (Blueprint $table) {
        $table->unsignedBigInteger('locked_by')->nullable();
        $table->timestamp('locked_at')->nullable();
        $table->timestamp('lock_expire_at')->nullable();
    });
}

public function down()
{
    Schema::table('complaints', function (Blueprint $table) {
        $table->dropColumn(['locked_by', 'locked_at', 'lock_expire_at']);
    });
}

};
