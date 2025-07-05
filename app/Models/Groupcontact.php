<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Groupcontact extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'contact_id',
        'group_id',
        
    ];
    public function contact()
    {
        return $this->belongsTo('App\Models\Contact'); // Using string literal
    }

    public function group()
    {
        return $this->belongsTo('App\Models\Group'); // Using string literal
    }
}
