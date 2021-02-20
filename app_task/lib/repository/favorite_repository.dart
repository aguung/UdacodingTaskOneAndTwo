import 'dart:io';
import 'dart:convert';
import 'package:app_task/model/favorite_user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository {
  final _baseUrl = 'http://192.168.43.48/backend';
  final Dio client;

  FavoriteRepository(this.client);

  Future<Either<String, FavoriteUser>> getFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await this.client.get(
            '$_baseUrl/favorite/${prefs.getString('userId')}',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Bearer ${prefs.getString('token')}",
            }),
          );
      return Right(FavoriteUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }

  Future<Either<String, FavoriteUser>> deleteFavorite(String favoriteId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await this.client.delete(
        '$_baseUrl/favorite/$favoriteId',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${prefs.getString('token')}",
        }),
      );
      return Right(FavoriteUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }

  Future<Either<String, FavoriteUser>> getGrafik() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await this.client.get(
        '$_baseUrl/grafik',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer ${prefs.getString('token')}",
        }),
      );
      return Right(FavoriteUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }

  Future<Either<String, FavoriteUser>> addFavorite(String videoId,
      String videoName, String videoUrl, String videoThumbnail) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await this.client.post(
            '$_baseUrl/favorite',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Bearer ${prefs.getString('token')}",
            }),
            data: jsonEncode(<String, String>{
              'user_id': prefs.getString('userId'),
              'favorite_video_id': videoId,
              'favorite_video_name': videoName,
              'favorite_video_url': videoUrl,
              'favorite_video_thumbnail': videoThumbnail,
            }),
          );
      return Right(FavoriteUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }
}
