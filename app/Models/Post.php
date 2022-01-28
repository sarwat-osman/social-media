<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
   	protected $table = 'posts';

   	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'post_content',
        'page_id',
        'owner_id',
        'created_at',
        'updated_at',
    ];
}
