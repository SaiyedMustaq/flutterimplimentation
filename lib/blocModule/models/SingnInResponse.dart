class SignInResponse {
  int status;
  String message;
  Result result;

  SignInResponse({this.status, this.message, this.result});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String token;
  User user;

  Result({this.token, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  int roleId;
  String remark;
  int isActive;
  Null resetCode;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  int isEditable;

  User(
      {this.id,
      this.name,
      this.email,
      this.roleId,
      this.remark,
      this.isActive,
      this.resetCode,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.isEditable});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    roleId = json['role_id'];
    remark = json['remark'];
    isActive = json['is_active'];
    resetCode = json['reset_code'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isEditable = json['is_editable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    data['remark'] = this.remark;
    data['is_active'] = this.isActive;
    data['reset_code'] = this.resetCode;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_editable'] = this.isEditable;
    return data;
  }
}
