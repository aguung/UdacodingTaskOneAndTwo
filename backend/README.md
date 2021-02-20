# API Spesification

## Registrasi
- Method : POST
- Endpoint : `/auth/register`
- Body :
````json
{
    "user_name":"string|required",
    "user_email":"string|required|min_length[6]|max_length[50]|valid_email|is_unique",
    "user_password":"string|required|min_length[8]|max_length[255]
}
````
- Response :
````json
{
    "message": "string",
    "user": {
        "user_id": "string",
        "user_name": "string",
        "user_email": "string",
        "user_updated_at": "date",
        "user_created_at": "date"
    },
    "access_token": "string"
}
````

## Login
- Method : POST
- Endpoint : `/auth/login`
- Body :

````json
{
    "user_email":"string|min_length[6]|max_length[50]|valid_email",
    "user_password":"string|required|min_length[8]|max_length[255]|validateUser
}
````
- Response :
````json
{
    "message": "string",
    "user": {
        "user_id": "string",
        "user_name": "string",
        "user_email": "string",
        "user_updated_at": "date",
        "user_created_at": "date"
    },
    "access_token": "string"
}
````



## Create Favorite
- Method : POST
- Endpoint : `/favorite`
- Header :
    - Content-type : application/json
    - Accept : application/json
    - Authorization : Bearer `access_token`
- Body :
````json
{
    "user_id":"string|required",
    "favorite_video_id":"string|required",
    "favorite_video_name":"string|required",
    "favorite_video_url":"string|required",
    "favorite_video_thumbnail":"string|required",
}
````
- Response :
````json
{
    "message": "string"
}
````

## Get Favorite By UserID
- Method : GET
- Endpoint : `/favorite/{user_id}`
- Header :
    - Content-type : application/json
    - Accept : application/json
    - Authorization : Bearer `access_token`
- Response :
````json
{
    "message": "string",
    "favorite": [
        {
           "favorite_id": "string",
            "user_id": "string",
            "favorite_video_id": "string",
            "favorite_video_name": "string",
            "favorite_video_url": "string",
            "favorite_video_thumbnail": "string",
            "favorite_created_at": "date"
        }
    ]
}
````

## Delete Favorite By ID
- Method : DELETE
- Endpoint : `/favorite/{favorite_id}`
- Header :
    - Content-type : application/json
    - Accept : application/json
    - Authorization : Bearer `access_token`
- Response :
````json
{
    "message": "string"
}
````