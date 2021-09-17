// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.mobileNumber,
    this.createdAt,
    this.token,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String mobileNumber;
  String createdAt;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    countryCode: json["country_code"],
    mobileNumber: json["mobile_number"],
    createdAt: json["created_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country_code": countryCode,
    "mobile_number": mobileNumber,
    "created_at": createdAt,
    "token": token,
  };
}
