<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class BackupDatabase extends Command
{
    protected $signature = 'backup:run';
    protected $description = 'Take a backup of the database';

    public function handle()
    {
        $filename = 'backup_' . date('Y_m_d_H_i_s') . '.sql';
        $path = storage_path('backups/' . $filename);

        $dbName = env('DB_DATABASE');
        $dbUser = env('DB_USERNAME');
        $dbPass = env('DB_PASSWORD');

        $command = "C:\\xampp\\mysql\\bin\\mysqldump.exe -u {$dbUser} -p{$dbPass} {$dbName} > {$path}";
        $returnVar = null;
        $output = null;
        exec($command, $output, $returnVar);

        if ($returnVar === 0) {
            $this->info("Backup successful: {$filename}");
        } else {
            $this->error("Backup failed");
        }
    }
}
