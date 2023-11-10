<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kalnoy\Nestedset\NodeTrait;

class Category extends Model
{
    use NodeTrait;
    use HasFactory;
    protected $table = 'categories';

    protected $left_column = 'lft';

    protected $right_column = 'rgt';
    



public function parent()
{
return $this->belongsTo(self::class, 'parent_id');
}

public function children()
{
return $this->hasMany(self::class, 'parent_id');
}

}
