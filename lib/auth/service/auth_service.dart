import 'dart:convert';

import 'package:fantasy_triathlon_league/api/api.dart';
import 'package:fantasy_triathlon_league/api/responce_handler.dart';
import 'package:fantasy_triathlon_league/auth/view/login/model/login_data_model.dart';
import 'package:fantasy_triathlon_league/auth/view/signup/model/register_data_model.dart';
import 'package:fantasy_triathlon_league/auth/view/user_data/model/user_raw_data_model.dart';
import 'package:fantasy_triathlon_league/utils/api_constants.dart';

class AuthService {
  static Future<RegisterApiDataModel> registerApi(
      {required String email, required String password}) async {
    final response = await Api().post(ApiConstants.signUp,
        queryData: {"email": email, "password": password});
    print("response---${response.statusCode}");
    print("data---${response.body}");
    await ResponseHandler.checkResponseError(response);
    return RegisterApiDataModel.fromJson(jsonDecode(response.body));
  }

  static Future<RegisterApiDataModel> verifyRegisterApi(
      {required String email, required String otp}) async {
    final response = await Api()
        .post(ApiConstants.otpVerify, queryData: {"email": email, "otp": otp});
    print("response---${response.statusCode}");
    print("data---${response.body}");
    await ResponseHandler.checkResponseError(response);
    return RegisterApiDataModel.fromJson(jsonDecode(response.body));
  }

  static Future<LoginDataModel> loginApi(
      {required String email, required String password}) async {
    final response = await Api().post(ApiConstants.signIn,
        queryData: {"email": email, "password": password});
    print("response---${response.statusCode}");
    print("data---${response.body}");
    await ResponseHandler.checkResponseError(response);
    return LoginDataModel.fromJson(jsonDecode(response.body));
  }

  static Future<void> forgotPasswordApi({required String email}) async {
    final response = await Api().post(ApiConstants.forgotPassword, queryData: {
      "email": email,
    });
    print("response---${response.statusCode}");
    print("data---${response.body}");
    await ResponseHandler.checkResponseError(response);
  }

  static Future<int> userDataApiCalling(
      {required UserRawDataModel userDataRawModel}) async {
    final response = await Api().userDataApi(
        api: ApiConstants.userData,
        bodyData: {
          "email": userDataRawModel.email ?? "",
          "firstName": userDataRawModel.firstName ?? "",
          "lastName": userDataRawModel.lastName ?? "",
          "caption": userDataRawModel.caption ?? "",
          "country": userDataRawModel.country ?? "",
          "gender": userDataRawModel.gender ?? "",
          "age": userDataRawModel.age ?? ""
        },
        image: userDataRawModel.profileImg);
    return response;
  }

  static Future newPasswordSet(
      {required String email, required String password}) async {
    final response = await Api().post(ApiConstants.changePassword,
        queryData: {"email": email, "password": password});
    await ResponseHandler.checkResponseError(response);
  }
}
