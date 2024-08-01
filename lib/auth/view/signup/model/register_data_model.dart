class RegisterApiDataModel {
  int? statusCode;
  String? message;
  String? token;
  Data? data;

  RegisterApiDataModel({this.statusCode, this.message, this.token, this.data});

  RegisterApiDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? password;
  int? otp;
  String? profileUrl;
  String? firstName;
  String? lastName;
  String? caption;
  String? country;
  String? gender;
  int? age;
  List<String>? followedAthletes;
  int? otpExpireTime;
  String? id;
  int? userId;
  String? role;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.email,
      this.password,
      this.otp,
      this.profileUrl,
      this.firstName,
      this.lastName,
      this.caption,
      this.country,
      this.gender,
      this.age,
      this.followedAthletes,
      this.otpExpireTime,
      this.id,
      this.userId,
      this.role,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    otp = json['otp'];
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
    otpExpireTime = json['otpExpireTime'];
    id = json['id'];
    userId = json['userId'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['otp'] = this.otp;
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
    data['otpExpireTime'] = this.otpExpireTime;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
