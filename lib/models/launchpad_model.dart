class LaunchpadModel {
  Images? images;
  String? name;
  String? fullName;
  String? locality;
  String? region;
  double? latitude;
  double? longitude;
  int? launchAttempts;
  int? launchSuccesses;
  List<String>? rockets;
  String? timezone;
  List<String>? launches;
  String? status;
  String? details;
  String? id;

  LaunchpadModel.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
    fullName = json['full_name'];
    locality = json['locality'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    launchAttempts = json['launch_attempts'];
    launchSuccesses = json['launch_successes'];
    rockets = json['rockets'].cast<String>();
    timezone = json['timezone'];
    launches = json['launches'].cast<String>();
    status = json['status'];
    details = json['details'];
    id = json['id'];
  }
}

class Images {
  List<String>? large;

  Images({this.large});

  Images.fromJson(Map<String, dynamic> json) {
    large = json['large'].cast<String>();
  }
}
