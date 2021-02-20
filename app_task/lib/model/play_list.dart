import 'package:equatable/equatable.dart';

/// kind : "youtube#playlistItem"
/// etag : "xz9hrnRR1_1U4JbgUlKV3SYSBq4"
/// id : "UEwtQ3RkQ0FwRUZIX3Q1X2R0Q1FaZ1dKcVdGNDVXUmdady5ENDU4Q0M4RDExNzM1Mjcy"
/// snippet : {"publishedAt":"2020-07-30T04:31:48Z","channelId":"UC14ZKB9XsDZbnHVmr4AmUpQ","title":"Belajar Go-Lang - 1 Pengenalan Go Lang","description":"Halo semuanya, selamat datang di channel Programmer Zaman Now\n\nDi series kali ini, kita akan belajar bahasa pemrograman Go-Lang dasar untuk pemula. Tutorialnya dibuat sedetail mungkin agar bisa dijadikan bahan referensi lengkap untuk teman-teman belajar Go-Lang\n\nPlaylist : https://www.youtube.com/playlist?list=PL-CtdCApEFH_t5_dtCQZgWJqWF45WRgZw\n\nSlide : https://docs.google.com/presentation/d/1QNFV9kjV4TfN-FVFLT6-8Urq2MmadAmgc1puk-YE5Fs/edit?usp=sharing\n\nSource Code : https://github.com/ProgrammerZamanNow/belajar-golang-dasar\n\n#golang #tutorialGolang #golangDasar\n-- Let's connect :\nInstagram : https://www.instagram.com/programmerzamannow\nTelegram : https://t.me/ProgrammerZamanNow\nYoutube : https://www.youtube.com/c/ProgrammerZamanNow\nFacebook : https://www.facebook.com/khannedy\nTwitter : https://twitter.com/khannedy","thumbnails":{"default":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg","width":480,"height":360},"standard":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/sddefault.jpg","width":640,"height":480},"maxres":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/maxresdefault.jpg","width":1280,"height":720}},"channelTitle":"Programmer Zaman Now","playlistId":"PL-CtdCApEFH_t5_dtCQZgWJqWF45WRgZw","position":0,"resourceId":{"kind":"youtube#video","videoId":"nyGu8Xn5b3g"},"videoOwnerChannelTitle":"Programmer Zaman Now","videoOwnerChannelId":"UC14ZKB9XsDZbnHVmr4AmUpQ"}
/// contentDetails : {"videoId":"nyGu8Xn5b3g","videoPublishedAt":"2020-08-07T02:00:05Z"}
/// status : {"privacyStatus":"public"}


class PlayList extends Equatable {
  String _kind;
  String _etag;
  String _id;
  Snippet _snippet;
  ContentDetails _contentDetails;
  Status _status;

  String get kind => _kind;

  String get etag => _etag;

  String get id => _id;

  Snippet get snippet => _snippet;

  ContentDetails get contentDetails => _contentDetails;

  Status get status => _status;

  PlayList(
      {String kind,
      String etag,
      String id,
      Snippet snippet,
      ContentDetails contentDetails,
      Status status}) {
    _kind = kind;
    _etag = etag;
    _id = id;
    _snippet = snippet;
    _contentDetails = contentDetails;
    _status = status;
  }

  PlayList.fromJson(dynamic json) {
    _kind = json["kind"];
    _etag = json["etag"];
    _id = json["id"];
    _snippet =
        json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null;
    _contentDetails = json["contentDetails"] != null
        ? ContentDetails.fromJson(json["contentDetails"])
        : null;
    _status = json["status"] != null ? Status.fromJson(json["status"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kind"] = _kind;
    map["etag"] = _etag;
    map["id"] = _id;
    if (_snippet != null) {
      map["snippet"] = _snippet.toJson();
    }
    if (_contentDetails != null) {
      map["contentDetails"] = _contentDetails.toJson();
    }
    if (_status != null) {
      map["status"] = _status.toJson();
    }
    return map;
  }

  @override
  List<Object> get props => [_kind, _etag, _id, _snippet, _contentDetails];
}

/// privacyStatus : "public"

class Status {
  String _privacyStatus;

  String get privacyStatus => _privacyStatus;

  Status({String privacyStatus}) {
    _privacyStatus = privacyStatus;
  }

  Status.fromJson(dynamic json) {
    _privacyStatus = json["privacyStatus"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["privacyStatus"] = _privacyStatus;
    return map;
  }
}

/// videoId : "nyGu8Xn5b3g"
/// videoPublishedAt : "2020-08-07T02:00:05Z"

class ContentDetails {
  String _videoId;
  String _videoPublishedAt;

  String get videoId => _videoId;

  String get videoPublishedAt => _videoPublishedAt;

  ContentDetails({String videoId, String videoPublishedAt}) {
    _videoId = videoId;
    _videoPublishedAt = videoPublishedAt;
  }

  ContentDetails.fromJson(dynamic json) {
    _videoId = json["videoId"];
    _videoPublishedAt = json["videoPublishedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["videoId"] = _videoId;
    map["videoPublishedAt"] = _videoPublishedAt;
    return map;
  }
}

/// publishedAt : "2020-07-30T04:31:48Z"
/// channelId : "UC14ZKB9XsDZbnHVmr4AmUpQ"
/// title : "Belajar Go-Lang - 1 Pengenalan Go Lang"
/// description : "Halo semuanya, selamat datang di channel Programmer Zaman Now\n\nDi series kali ini, kita akan belajar bahasa pemrograman Go-Lang dasar untuk pemula. Tutorialnya dibuat sedetail mungkin agar bisa dijadikan bahan referensi lengkap untuk teman-teman belajar Go-Lang\n\nPlaylist : https://www.youtube.com/playlist?list=PL-CtdCApEFH_t5_dtCQZgWJqWF45WRgZw\n\nSlide : https://docs.google.com/presentation/d/1QNFV9kjV4TfN-FVFLT6-8Urq2MmadAmgc1puk-YE5Fs/edit?usp=sharing\n\nSource Code : https://github.com/ProgrammerZamanNow/belajar-golang-dasar\n\n#golang #tutorialGolang #golangDasar\n-- Let's connect :\nInstagram : https://www.instagram.com/programmerzamannow\nTelegram : https://t.me/ProgrammerZamanNow\nYoutube : https://www.youtube.com/c/ProgrammerZamanNow\nFacebook : https://www.facebook.com/khannedy\nTwitter : https://twitter.com/khannedy"
/// thumbnails : {"default":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/default.jpg","width":120,"height":90},"medium":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/mqdefault.jpg","width":320,"height":180},"high":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg","width":480,"height":360},"standard":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/sddefault.jpg","width":640,"height":480},"maxres":{"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/maxresdefault.jpg","width":1280,"height":720}}
/// channelTitle : "Programmer Zaman Now"
/// playlistId : "PL-CtdCApEFH_t5_dtCQZgWJqWF45WRgZw"
/// position : 0
/// resourceId : {"kind":"youtube#video","videoId":"nyGu8Xn5b3g"}
/// videoOwnerChannelTitle : "Programmer Zaman Now"
/// videoOwnerChannelId : "UC14ZKB9XsDZbnHVmr4AmUpQ"

class Snippet {
  String _publishedAt;
  String _channelId;
  String _title;
  String _description;
  Thumbnails _thumbnails;
  String _channelTitle;
  String _playlistId;
  int _position;
  ResourceId _resourceId;
  String _videoOwnerChannelTitle;
  String _videoOwnerChannelId;

  String get publishedAt => _publishedAt;

  String get channelId => _channelId;

  String get title => _title;

  String get description => _description;

  Thumbnails get thumbnails => _thumbnails;

  String get channelTitle => _channelTitle;

  String get playlistId => _playlistId;

  int get position => _position;

  ResourceId get resourceId => _resourceId;

  String get videoOwnerChannelTitle => _videoOwnerChannelTitle;

  String get videoOwnerChannelId => _videoOwnerChannelId;

  Snippet(
      {String publishedAt,
      String channelId,
      String title,
      String description,
      Thumbnails thumbnails,
      String channelTitle,
      String playlistId,
      int position,
      ResourceId resourceId,
      String videoOwnerChannelTitle,
      String videoOwnerChannelId}) {
    _publishedAt = publishedAt;
    _channelId = channelId;
    _title = title;
    _description = description;
    _thumbnails = thumbnails;
    _channelTitle = channelTitle;
    _playlistId = playlistId;
    _position = position;
    _resourceId = resourceId;
    _videoOwnerChannelTitle = videoOwnerChannelTitle;
    _videoOwnerChannelId = videoOwnerChannelId;
  }

  Snippet.fromJson(dynamic json) {
    _publishedAt = json["publishedAt"];
    _channelId = json["channelId"];
    _title = json["title"];
    _description = json["description"];
    _thumbnails = json["thumbnails"] != null
        ? Thumbnails.fromJson(json["thumbnails"])
        : null;
    _channelTitle = json["channelTitle"];
    _playlistId = json["playlistId"];
    _position = json["position"];
    _resourceId = json["resourceId"] != null
        ? ResourceId.fromJson(json["resourceId"])
        : null;
    _videoOwnerChannelTitle = json["videoOwnerChannelTitle"];
    _videoOwnerChannelId = json["videoOwnerChannelId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["publishedAt"] = _publishedAt;
    map["channelId"] = _channelId;
    map["title"] = _title;
    map["description"] = _description;
    if (_thumbnails != null) {
      map["thumbnails"] = _thumbnails.toJson();
    }
    map["channelTitle"] = _channelTitle;
    map["playlistId"] = _playlistId;
    map["position"] = _position;
    if (_resourceId != null) {
      map["resourceId"] = _resourceId.toJson();
    }
    map["videoOwnerChannelTitle"] = _videoOwnerChannelTitle;
    map["videoOwnerChannelId"] = _videoOwnerChannelId;
    return map;
  }
}

/// kind : "youtube#video"
/// videoId : "nyGu8Xn5b3g"

class ResourceId {
  String _kind;
  String _videoId;

  String get kind => _kind;

  String get videoId => _videoId;

  ResourceId({String kind, String videoId}) {
    _kind = kind;
    _videoId = videoId;
  }

  ResourceId.fromJson(dynamic json) {
    _kind = json["kind"];
    _videoId = json["videoId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kind"] = _kind;
    map["videoId"] = _videoId;
    return map;
  }
}

/// default : {"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/default.jpg","width":120,"height":90}
/// medium : {"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/mqdefault.jpg","width":320,"height":180}
/// high : {"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg","width":480,"height":360}
/// standard : {"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/sddefault.jpg","width":640,"height":480}
/// maxres : {"url":"https://i.ytimg.com/vi/nyGu8Xn5b3g/maxresdefault.jpg","width":1280,"height":720}

class Thumbnails {
  Default _default;
  Medium _medium;
  High _high;
  Standard _standard;
  Maxres _maxres;

  Default get defaul => _default;

  Medium get medium => _medium;

  High get high => _high;

  Standard get standard => _standard;

  Maxres get maxres => _maxres;

  Thumbnails(
      {Default defaul,
      Medium medium,
      High high,
      Standard standard,
      Maxres maxres}) {
    _default = defaul;
    _medium = medium;
    _high = high;
    _standard = standard;
    _maxres = maxres;
  }

  Thumbnails.fromJson(dynamic json) {
    _default =
        json["default"] != null ? Default.fromJson(json["default"]) : null;
    _medium = json["medium"] != null ? Medium.fromJson(json["medium"]) : null;
    _high = json["high"] != null ? High.fromJson(json["high"]) : null;
    _standard =
        json["standard"] != null ? Standard.fromJson(json["standard"]) : null;
    _maxres = json["maxres"] != null ? Maxres.fromJson(json["maxres"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_default != null) {
      map["default"] = _default.toJson();
    }
    if (_medium != null) {
      map["medium"] = _medium.toJson();
    }
    if (_high != null) {
      map["high"] = _high.toJson();
    }
    if (_standard != null) {
      map["standard"] = _standard.toJson();
    }
    if (_maxres != null) {
      map["maxres"] = _maxres.toJson();
    }
    return map;
  }
}

/// url : "https://i.ytimg.com/vi/nyGu8Xn5b3g/maxresdefault.jpg"
/// width : 1280
/// height : 720

class Maxres {
  String _url;
  int _width;
  int _height;

  String get url => _url;

  int get width => _width;

  int get height => _height;

  Maxres({String url, int width, int height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  Maxres.fromJson(dynamic json) {
    _url = json["url"];
    _width = json["width"];
    _height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["width"] = _width;
    map["height"] = _height;
    return map;
  }
}

/// url : "https://i.ytimg.com/vi/nyGu8Xn5b3g/sddefault.jpg"
/// width : 640
/// height : 480

class Standard {
  String _url;
  int _width;
  int _height;

  String get url => _url;

  int get width => _width;

  int get height => _height;

  Standard({String url, int width, int height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  Standard.fromJson(dynamic json) {
    _url = json["url"];
    _width = json["width"];
    _height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["width"] = _width;
    map["height"] = _height;
    return map;
  }
}

/// url : "https://i.ytimg.com/vi/nyGu8Xn5b3g/hqdefault.jpg"
/// width : 480
/// height : 360

class High {
  String _url;
  int _width;
  int _height;

  String get url => _url;

  int get width => _width;

  int get height => _height;

  High({String url, int width, int height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  High.fromJson(dynamic json) {
    _url = json["url"];
    _width = json["width"];
    _height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["width"] = _width;
    map["height"] = _height;
    return map;
  }
}

/// url : "https://i.ytimg.com/vi/nyGu8Xn5b3g/mqdefault.jpg"
/// width : 320
/// height : 180

class Medium {
  String _url;
  int _width;
  int _height;

  String get url => _url;

  int get width => _width;

  int get height => _height;

  Medium({String url, int width, int height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  Medium.fromJson(dynamic json) {
    _url = json["url"];
    _width = json["width"];
    _height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["width"] = _width;
    map["height"] = _height;
    return map;
  }
}

/// url : "https://i.ytimg.com/vi/nyGu8Xn5b3g/default.jpg"
/// width : 120
/// height : 90

class Default {
  String _url;
  int _width;
  int _height;

  String get url => _url;

  int get width => _width;

  int get height => _height;

  Default({String url, int width, int height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  Default.fromJson(dynamic json) {
    _url = json["url"];
    _width = json["width"];
    _height = json["height"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    map["width"] = _width;
    map["height"] = _height;
    return map;
  }
}
