import 'dart:convert';
import 'dart:developer';

import 'package:fantasy_triathlon_league/utils/api_constants.dart';
import 'package:fantasy_triathlon_league/utils/app_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:image_picker/image_picker.dart';

import 'logger_interceptor.dart';

Future<Map<String, String>> headers() async {
  final Map<String, String> headers = <String, String>{};

  final String token = AppPreference.getUserToken() ?? "";

  if (token.isNotEmpty) {
    headers["Authorization"] = "Bearer$token";
  }
  // headers["Content-Type"] = "application/json";
  // headers["accept"] = " */*";

  return headers;
}

class Api {
  static Api? _instance;

  static http.Client get dio => InterceptedClient.build(
        interceptors: [
          LoggerInterceptor(),
        ],
      );

  factory Api() {
    if (_instance == null) {
      _instance = Api._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Api._();

  Future<http.Response> post(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    log("post ${await headers()}}");
    final response = await dio.post(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<int> userDataApi({
    required String api,
    required XFile? image,
    required Map<String, String> bodyData,
  }) async {
    var request = http.MultipartRequest('POST', getUrl(api));

    try {
      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath("profileImg", image.path));
      }
      request.fields.addAll(bodyData);
      request.headers
          .addAll({'accept': '*/*', 'Content-Type': 'multipart/form-data'});
      final result = await request.send();
      var byte = await result.stream.bytesToString();
      if (result.statusCode == 201) {
        print(await result.stream.bytesToString());
      } else {
        print(result.reasonPhrase);
      }
      var jsonData = jsonDecode(byte);
      print("jsonData----$jsonData");
      return result.statusCode;
    } catch (e, st) {
      print("$e,$st");
      rethrow;
    }
  }

  Future<http.Response> put(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    log("put ${await headers()}}");
    final response = await dio.put(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> patch(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.patch(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> delete(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.delete(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> head(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await dio.head(
      getUrl(url, queryParameters: queryData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> get(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    log("get ${await headers()}}");
    final response = await dio.get(
      getUrl(url, queryParameters: queryData),
      headers: await headers(),
    );
    return response;
  }
}

Uri getUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
  String url = "${ApiConstants.BASE_URL}$endpoint";
  if (queryParameters != null && queryParameters.isNotEmpty) {
    url = "$url?";
    for (int i = 0; i < queryParameters.entries.length; i++) {
      final element = queryParameters.entries.elementAt(i);
      url += '${element.key}=${element.value}';
      if (i < queryParameters.entries.length - 1) {
        url += '&';
      }
    }
  }
  log(Uri.parse(url).toString());
  return Uri.parse(url);
}

Uri parseUrl(String url) {
  log(Uri.parse(url).toString());
  return Uri.parse(url);
}
