class LoginDataModel {
  int? statusCode;
  String? message;
  Data? data;
  String? token;

  LoginDataModel({this.statusCode, this.message, this.data, this.token});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? id;
  int? userId;
  String? role;
  String? email;
  String? password;
  String? profileUrl;
  String? firstName;
  String? lastName;
  String? caption;
  String? country;
  String? gender;
  dynamic age;
  List<String>? followedAthletes;
  int? otp;
  int? otpExpireTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.role,
      this.email,
      this.password,
      this.profileUrl,
      this.firstName,
      this.lastName,
      this.caption,
      this.country,
      this.gender,
      this.age,
      this.followedAthletes,
      this.otp,
      this.otpExpireTime,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    role = json['role'];
    email = json['email'];
    password = json['password'];
    profileUrl = json['profileUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    caption = json['caption'];
    country = json['country'];
    gender = json['gender'];
    age = json['age'];
    if (json['followed_athletes'] != null) {
      followedAthletes = List<String>.from(json['followed_athletes']);
    }
    otp = json['otp'];
    otpExpireTime = json['otpExpireTime'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profileUrl'] = this.profileUrl;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['caption'] = this.caption;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['age'] = this.age;
    if (this.followedAthletes != null) {
      data['followed_athletes'] =
          this.followedAthletes!.map((v) => v.toString()).toList();
    }
    data['otp'] = this.otp;
    data['otpExpireTime'] = this.otpExpireTime;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
