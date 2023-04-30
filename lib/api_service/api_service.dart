import 'dart:convert';
import 'dart:developer' as d;
import 'package:test_project/api_config/api_configuration.dart';
import 'package:test_project/helpers/http.dart';

class api_service{
  final apiUrl = API_URL;
  final HTTP _http = HTTP();

  Future<ApiResponse> universityInfo() async {
    try {
      final apiResponse = await _http.get( "$apiUrl/search?country=United+States");
      return _processApiResponse(apiResponse);
    } catch (e) {
      d.log("Error::ApiService::createUpdateOrder: ${e.toString()}");
      ApiResponse response = ApiResponse(success: false, message: e.toString());
      return Future.value(response);
    }
  }

  static ApiResponse _processApiResponse(dynamic apiResponse) {
    try {
      if (apiResponse.statusCode != null) {
        if (apiResponse.statusCode == 200) {
          var body = jsonDecode(apiResponse.body);
          var res = ApiResponse.fromJson(body);
          return res;
        } else {
          return ApiResponse.fromJson(jsonDecode(apiResponse.body));
        }
      } else {
        ApiResponse response =
        ApiResponse(success: false, message: "Server error");
        return response;
      }
    } catch (e) {
      d.log("Error::ApiService::_processApiResponse: ${e.toString()}");
      ApiResponse response = ApiResponse(success: false, message: e.toString());
      return response;
    }
  }

}
class ApiResponse {
  late bool success;
  String? message;
  String? accessToken;
  dynamic data;

  ApiResponse(
      {this.success = false, this.message, this.accessToken, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> response) {
    return ApiResponse(
        success: response["Success"],
        message: response["Message"]?.toString(),
        accessToken: response["accessToken"]?.toString(),
        data: response['Data']);
  }
}