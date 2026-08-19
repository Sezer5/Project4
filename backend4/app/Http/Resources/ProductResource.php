<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'quantity' => $this->quantity,
            'price' => $this->price,
            'description' => $this->description,
            'thumbnail' => $this->thumbnail,
            'status' => $this->status,
            'colors' => $this->colors,
            'sizes' => $this->sizes
        ];
    }
}
