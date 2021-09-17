class LoginRequest {
  LoginRequest({this.name, this.password});
  String name;
  String password;
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        name: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": name,
        "password": password,
      };
}
