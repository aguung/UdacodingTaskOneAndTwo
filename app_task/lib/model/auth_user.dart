/// message : "User authenticated successfully"
/// user : {"user_id":"1","user_name":"admin","user_email":"admin@backend.com","user_updated_at":null,"user_created_at":"2021-02-12 13:40:58"}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImFkbWluQGJhY2tlbmQuY29tIiwiaWF0IjoxNjEzNTM2NzUxLCJleHAiOjE5NzM1MzY3NTF9.jREcWl2HjmcQ4pgJWLI_9uLGV0vPjeNz_wd4Q6j9iDo"

class AuthUser {
  String _message;
  User _user;
  String _accessToken;

  String get message => _message;

  User get user => _user;

  String get accessToken => _accessToken;

  AuthUser({String message, User user, String accessToken}) {
    _message = message;
    _user = user;
    _accessToken = accessToken;
  }

  AuthUser.fromJson(dynamic json) {
    _message = json["message"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _accessToken = json["access_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    map["access_token"] = _accessToken;
    return map;
  }
}

/// user_id : "1"
/// user_name : "admin"
/// user_email : "admin@backend.com"
/// user_updated_at : null
/// user_created_at : "2021-02-12 13:40:58"

class User {
  String _userId;
  String _userName;
  String _userEmail;
  dynamic _userUpdatedAt;
  dynamic _userCreatedAt;

  String get userId => _userId;

  String get userName => _userName;

  String get userEmail => _userEmail;

  dynamic get userUpdatedAt => _userUpdatedAt;

  dynamic get userCreatedAt => _userCreatedAt;

  User(
      {String userId,
      String userName,
      String userEmail,
      dynamic userUpdatedAt,
      dynamic userCreatedAt}) {
    _userId = userId;
    _userName = userName;
    _userEmail = userEmail;
    _userUpdatedAt = userUpdatedAt;
    _userCreatedAt = userCreatedAt;
  }

  User.fromJson(dynamic json) {
    _userId = json["user_id"];
    _userName = json["user_name"];
    _userEmail = json["user_email"];
    _userUpdatedAt = json["user_updated_at"];
    _userCreatedAt = json["user_created_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["user_name"] = _userName;
    map["user_email"] = _userEmail;
    map["user_updated_at"] = _userUpdatedAt;
    map["user_created_at"] = _userCreatedAt;
    return map;
  }
}
