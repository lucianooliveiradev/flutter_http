import 'Address.dart';
import 'Company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  int? addressId;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  int? companyId;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.addressId,
      this.phone,
      this.website,
      this.companyId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    addressId = json['addressId'];
    phone = json['phone'];
    website = json['website'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address?.toJson();
      data['addresId'] = this.addressId;
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company?.toJson();
      data['companyId'] = this.companyId;
    }
    return data;
  }
}
