<?php

namespace App\Models;

use CodeIgniter\Model;
use Exception;

class FavoriteModel extends Model
{
    protected $table = 'favorite';
    protected $allowedFields = [
        'user_id',
        'favorite_video_id',
        'favorite_video_name',
        'favorite_video_url',
        'favorite_video_thumbnail'
    ];

    public function findFavoriteById($id) {
        $favorite = $this
            ->asArray()
            ->where(['favorite_id' => $id])
            ->first();

        if (!$favorite) return ('Could not find client for specified ID');

        return $favorite;
    }

    public function findFavoriteByUser($id) {
        return $this
            ->asArray()
            ->where(['user_id' => $id]);
    }

    public function findFavoriteByUserAndVideo($user_id,$favorite_video_id) {
        return $this
            ->asArray()
            ->where(
                [
                    'user_id' => $user_id ,
                    'favorite_video_id' => $favorite_video_id
                ]
            )->first();
    }

}