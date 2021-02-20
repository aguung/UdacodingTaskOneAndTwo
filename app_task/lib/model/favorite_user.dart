/// message : "Favorite retrieved successfully"
/// favorite : [{"favorite_id":"4","user_id":"1","favorite_video_id":"nyGu8Xn5b3g","favorite_video_name":"Belajar Go-Lang - 1 Pengenalan Go Lang","favorite_video_url":"https://youtube.com/embed/nyGu8Xn5b3g ","favorite_video_thumbnail":"https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg","favorite_created_at":"2021-02-20 09:16:59"}]

class FavoriteUser {
  String _message;
  List<Favorite> _favorite;

  String get message => _message;
  List<Favorite> get favorite => _favorite;

  FavoriteUser({
      String message,
      List<Favorite> favorite}){
    _message = message;
    _favorite = favorite;
}

  FavoriteUser.fromJson(dynamic json) {
    _message = json["message"];
    if (json["favorite"] != null) {
      _favorite = [];
      json["favorite"].forEach((v) {
        _favorite.add(Favorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_favorite != null) {
      map["favorite"] = _favorite.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// favorite_id : "4"
/// user_id : "1"
/// favorite_video_id : "nyGu8Xn5b3g"
/// favorite_video_name : "Belajar Go-Lang - 1 Pengenalan Go Lang"
/// favorite_video_url : "https://youtube.com/embed/nyGu8Xn5b3g "
/// favorite_video_thumbnail : "https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg"
/// favorite_created_at : "2021-02-20 09:16:59"

class Favorite {
  String _favoriteId;
  String _userId;
  String _favoriteVideoId;
  String _favoriteVideoName;
  String _favoriteVideoUrl;
  String _favoriteVideoThumbnail;
  String _favoriteCreatedAt;

  String get favoriteId => _favoriteId;
  String get userId => _userId;
  String get favoriteVideoId => _favoriteVideoId;
  String get favoriteVideoName => _favoriteVideoName;
  String get favoriteVideoUrl => _favoriteVideoUrl;
  String get favoriteVideoThumbnail => _favoriteVideoThumbnail;
  String get favoriteCreatedAt => _favoriteCreatedAt;

  Favorite({
      String favoriteId,
      String userId,
      String favoriteVideoId,
      String favoriteVideoName,
      String favoriteVideoUrl,
      String favoriteVideoThumbnail,
      String favoriteCreatedAt}){
    _favoriteId = favoriteId;
    _userId = userId;
    _favoriteVideoId = favoriteVideoId;
    _favoriteVideoName = favoriteVideoName;
    _favoriteVideoUrl = favoriteVideoUrl;
    _favoriteVideoThumbnail = favoriteVideoThumbnail;
    _favoriteCreatedAt = favoriteCreatedAt;
}

  Favorite.fromJson(dynamic json) {
    _favoriteId = json["favorite_id"];
    _userId = json["user_id"];
    _favoriteVideoId = json["favorite_video_id"];
    _favoriteVideoName = json["favorite_video_name"];
    _favoriteVideoUrl = json["favorite_video_url"];
    _favoriteVideoThumbnail = json["favorite_video_thumbnail"];
    _favoriteCreatedAt = json["favorite_created_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["favorite_id"] = _favoriteId;
    map["user_id"] = _userId;
    map["favorite_video_id"] = _favoriteVideoId;
    map["favorite_video_name"] = _favoriteVideoName;
    map["favorite_video_url"] = _favoriteVideoUrl;
    map["favorite_video_thumbnail"] = _favoriteVideoThumbnail;
    map["favorite_created_at"] = _favoriteCreatedAt;
    return map;
  }

}