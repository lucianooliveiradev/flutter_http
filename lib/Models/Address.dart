import 'Geo.dart';

class Address {
  int? id;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;
  int? geoId;

  Address(
      {this.id, this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    if (json['geo'] != null) {
      geo = new Geo.fromJson(json['geo']);
      geoId = json['geoId'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo?.toJson();
      data['geoId'] = this.geo!.id;
    }
    return data;
  }
}
