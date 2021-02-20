<?php

namespace App\Controllers;

use App\Models\FavoriteModel;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;

class Favorite extends BaseController{

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger){
        parent::initController($request, $response, $logger);
        $this->db      = \Config\Database::connect();
    }

    public function index() {
        $model = new FavoriteModel();
        return $this->getResponse(
            [
                'message' => 'Favorite retrieved successfully',
                'result' => $model->findAll()
            ]
        );
    }

    public function store(){
        $rules = [
            'user_id' => 'required',
            'favorite_video_id' => 'required',
            'favorite_video_name' => 'required',
            'favorite_video_url' => 'required',
            'favorite_video_thumbnail' => 'required',
        ];

        $input = $this->getRequestInput($this->request);

        if (!$this->validateRequest($input, $rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }

        $model = new FavoriteModel();
        if($model->findFavoriteByUserAndVideo($input['user_id'],$input['favorite_video_id']) != null){
            return $this->getResponse(
                    [
                        'message' => 'Favorite already added',
                    ]
                );
        }

        $model->save($input);

        $favorite = $model->where('favorite_id', $model->getInsertID())->first();

        return $this->getResponse(
            [
                'message' => 'Favorite added successfully',
            ]
        );
    }

    public function show($id){
        try {
            $favorite = new FavoriteModel();
            if($favorite->findFavoriteByUser($id) == null){
                return $this->getResponse(
                    [
                        'message' => 'User does not have favorite',
                    ]
                );
            }
            
            
            return $this->getResponse(
                [
                    'message' => 'Favorite retrieved successfully',
                    'favorite' => $favorite->findAll()
                ]
            );

        } catch (Exception $e) {
            return $this->getResponse(
                [
                    'message' => $e->getMessage()
                ],
                ResponseInterface::HTTP_NOT_FOUND
            );
        }
    }


    public function destroy($id){
        try {

            $model = new FavoriteModel();
            $favorite = $model->findFavoriteById($id);
            $model->where('favorite_id', $favorite['favorite_id'])->delete();

            return $this
                ->getResponse(
                    [
                        'message' => 'Favorite deleted successfully'
                    ]
                );

        } catch (Exception $exception) {
            return $this->getResponse(
                [
                    'message' => $exception->getMessage()
                ],
                ResponseInterface::HTTP_NOT_FOUND
            );
        }
    }

    public function grafikFavorite(){
        try {
            $favorite = $this->db->table('favorite')
                        ->selectCount('favorite_video_id')
                        ->select('favorite_video_name, favorite_video_id as favorite_id')
                        ->groupBy("favorite_video_id")
                        ->get();
            
            return $this->getResponse(
                [
                    'message' => 'Favorite grafik retrieved successfully',
                    'favorite' => $favorite->getResult()
                ]
            );

        } catch (Exception $e) {
            return $this->getResponse(
                [
                    'message' => $e->getMessage()
                ],
                ResponseInterface::HTTP_NOT_FOUND
            );
        }
    
    }
}