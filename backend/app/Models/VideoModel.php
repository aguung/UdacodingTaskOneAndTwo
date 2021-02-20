<?php

namespace App\Models;

use CodeIgniter\Model;
use Exception;

class VideoModel extends Model
{
    protected $table = 'video';
    protected $allowedFields = [
        'video_name',
        'video_url',
    ];

    public function findVideoById($id){
        $video = $this
            ->asArray()
            ->where(['video_id' => $id])
            ->first();

        if (!$video) return('Could not find video for specified ID');

        return $video;
    }
}