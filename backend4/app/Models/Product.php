<?php

namespace App\Models;

use App\Models\Color;
use App\Models\Size;
use Illuminate\Database\Eloquent\Model;
use Override;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'quantity', 'price', 'description', 'thumbnail', 'status'];

    public function colors()
    {
        return $this->belongsToMany(Color::class);
    }

    public function sizes()
    {
        return $this->belongsToMany(Size::class);
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
