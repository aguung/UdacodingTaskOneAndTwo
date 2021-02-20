import 'dart:io';
import 'dart:convert';
import 'package:app_task/model/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final _baseUrl = 'http://192.168.43.48/backend/';
  final Dio client;

  AuthRepository(this.client);

  Future<Either<String, AuthUser>> login(String email, String password) async {
    try {
      final response = await this.client.post(
            '$_baseUrl/auth/login',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            data: jsonEncode(<String, String>{
              'user_email': email,
              'user_password': password,
            }),
          );
      return Right(AuthUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }

  Future<Either<String, AuthUser>> register(String email, String name, String password) async {
    try {
      final response = await this.client.post(
            '$_baseUrl/auth/register',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            data: jsonEncode(<String, String>{
              'user_name': name,
              'user_email': email,
              'user_password': password,
            }),
          );
      return Right(AuthUser.fromJson(response.data));
    } on DioError catch (error) {
      return Left('$error');
    }
  }
}
