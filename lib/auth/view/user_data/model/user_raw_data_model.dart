import 'package:image_picker/image_picker.dart';

class UserRawDataModel {
  String? email, firstName, lastName, caption, country, gender, age;
  XFile? profileImg;

  UserRawDataModel({
    this.email,
    this.profileImg,
    this.firstName,
    this.lastName,
    this.caption,
    this.country,
    this.gender,
    this.age,
  });
}
