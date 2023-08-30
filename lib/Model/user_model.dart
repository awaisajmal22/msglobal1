
import 'dart:convert';

List<UserModel> parseUserList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
}

class UserModel {
   int? id;
  String? name;
  String? username;
   String? email;
   String? street;
   String? suite;
   String? city;
   String? zipcode;
   String? phone;
   String? website;
   String? companyName;
   String? catchPhrase;
   String? companyBs;

  UserModel({
     this.id,
     this.name,
     this.username,
     this.email,
     this.street,
     this.suite,
     this.city,
     this.zipcode,
     this.phone,
     this.website,
     this.companyName,
     this.catchPhrase,
     this.companyBs,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      street: json['address']['street'],
      suite: json['address']['suite'],
      city: json['address']['city'],
      zipcode: json['address']['zipcode'],
      phone: json['phone'],
      website: json['website'],
      companyName: json['company']['name'],
      catchPhrase: json['company']['catchPhrase'],
      companyBs: json['company']['bs'],
    );
  }
}