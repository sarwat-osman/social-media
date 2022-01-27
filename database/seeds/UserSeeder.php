<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	DB::table('users')->insert([
            'first_name' => 'Sarwat',
            'last_name' => 'Osman',
            'email' => 'sarwat'.'@gmail.com',
            'password' => Hash::make('sarwat'),
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

    	for ($i=0; $i < 20; $i++) { 
	        DB::table('users')->insert([
	            'first_name' => Str::random(10),
	            'last_name' => Str::random(12),
	            'email' => Str::random(10).'@gmail.com',
	            'password' => Hash::make('password'),
	            'created_at' => date('Y-m-d H:i:s'),
	            'updated_at' => date('Y-m-d H:i:s'),
	        ]);
    	}
    }
}
