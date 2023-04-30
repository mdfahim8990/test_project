import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HTTP {
  static final HTTP _instance = HTTP._internal();
  HTTP._internal() {
    _httpClient = http.Client();
  }

  factory HTTP() => _instance;

  Map<String, String>? _headers;

  late http.Client _httpClient;

  String? token;

  http.Client getHttpClient() {
    return _httpClient;
  }

  void closeClient() {
    _httpClient.close();
  }

  Future<bool> hasToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userToken = sharedPreferences.getString("LOGGED_TOKEN");
    if (userToken == null) {
      return false;
    } else {
      var tk = userToken.split(' ')[1];
      bool isExpired = JwtDecoder.isExpired(tk);
      return isExpired;
    }
    // if (token != null) {
    //   return true;
    // } else {
    //   SharedPreferences sharedPreferences =
    //       await SharedPreferences.getInstance();
    //   final userToken = sharedPreferences.getString("LOGGED_TOKEN");
    //   JwtDecoder.isExpired(yourToken);
    //   if (userToken != null) {
    //     token = userToken;
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }
  }

  Map<String, String>? getHeadersWeb() {
    _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
    };
    return _headers;
  }

  Future<Map<String, String>> getHeaders() async {
    if (_headers == null) {
      _headers = {};
      _headers!["content-type"] = "application/json";
      _headers!["Accept"] = "application/json";
      _headers!["Access-Control-Allow-Origin"] = "*";
      // _headers!["Access-Control-Allow-Methods"] = "GET,POST,OPTIONS";
      _headers!["Access-Control-Allow-Credentials"] = "true";
      _headers!["Access-Control-Allow-Headers"] =
          "Origin,Content-Type,Authorization";
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // ignore: prefer_collection_literals
    if (sharedPreferences.containsKey('cookie')) {
      var header = sharedPreferences.getString('cookie');
      if (header != null) {
        _headers!["cookie"] = header;
      }
    }
    if (sharedPreferences.containsKey('LOGGED_TOKEN')) {
      var header = sharedPreferences.getString('LOGGED_TOKEN');
      if (header != null) {
        _headers!["Authorization"] = header;
      }
    }

    return _headers!;
  }

  /*Future<bool> hasToken() async {
    if (token != null) {
      return true;
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final userToken = sharedPreferences.getString("LOGGED_TOKEN");
      if (userToken != null) {
        token = userToken;
        return true;
      } else {
        return false;
      }
    }
  }*/

  Future<dynamic> post(String url, body) async {
    try {
      Map<String, String> headers = await getHeaders();
      return await getHttpClient()
          .post(Uri.parse(url), headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 50000));
    } catch (e) {
      log("HTTP [POST ERROR] :", error: e);
      return Future.value(http.Response(
          jsonEncode({"Success": false, "Message": e.toString()}), 400));
    }
  }

  Future<dynamic> get(String url) async {
    try {
      Map<String, String> headers = await getHeaders();
      return getHttpClient()
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 50000));
    } catch (e) {
      return Future.value(http.Response(
          jsonEncode({"Success": false, "Message": e.toString()}), 400));
    }
  }

  Future<http.Response> webPost(String url, dynamic body) {
    try {
      return getHttpClient()
          .post(Uri.parse(url),
              headers: {
                "content-type": "application/json",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Credentials": "true",
                "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
                "Access-Control-Allow-Headers":
                    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
                "Origin": "localhost:8080"
              },
              body: json.encode(body))
          .timeout(const Duration(seconds: 50000));
    } catch (e) {
      log("HTTP [WEBPOST ERROR] :", error: e);
      return Future.value(http.Response(
          jsonEncode({"Success": false, "Message": e.toString()}), 400));
    }
  }

  //
}
