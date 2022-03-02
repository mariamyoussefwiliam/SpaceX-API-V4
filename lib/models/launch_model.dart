class LaunchesModel {
  String? name;
  DateTime? dateUtc;
  String? launchpad;
  Links? links;

  LaunchesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateUtc = DateTime.parse(json['date_utc']);
    launchpad = json['launchpad'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
}

class Links {
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links.fromJson(Map<String, dynamic> json) {
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }
}
