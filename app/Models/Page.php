<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
	protected $table = 'pages';

	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'page_name',
        'owner_id',
        'created_at',
        'updated_at',
    ];
}
