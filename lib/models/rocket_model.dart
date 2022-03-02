class RocketModel {
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  String? name;

  String? id;

  RocketModel.fromJson(Map<String, dynamic> json) {
    height = json['height'] != null ? Diameter.fromJson(json['height']) : null;
    diameter =
        json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
    mass = json['mass'] != null ? Mass.fromJson(json['mass']) : null;

    id = json['id'];
  }
}

class Height {
  String? meters;
  String? feet;

  Height({this.meters, this.feet});

  Height.fromJson(Map<String, dynamic> json) {
    meters = json['meters'] as String;
    feet = json['feet'] as String;
  }
}

class Diameter {
  dynamic meters;
  dynamic feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }
}

class Mass {
  int? kg;
  int? lb;

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'];
    lb = json['lb'];
  }
}
