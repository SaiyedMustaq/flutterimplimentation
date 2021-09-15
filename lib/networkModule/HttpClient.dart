import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lazy_loading_listview/networkModule/APIExceptions.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';

class HttpClient {
  static final HttpClient _httpClientSingleton = HttpClient();

  static HttpClient get instance => _httpClientSingleton;

  Future<dynamic> postCall({String url, Map request}) async {
    var responseJson;
    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(Uri.parse(EndPoint.todos),
          headers: headers, body: request);
      responseJson = _returnResponseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Available');
    }
    return responseJson;
  }

  Future<dynamic> getCall({String url}) async {
    var responseJson;
    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response =
          await http.get(Uri.parse(EndPoint.todos), headers: headers);
      responseJson = _returnResponseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Available');
    }
    return responseJson;
  }

  String queryParams(Map<String, String> param) {
    if (param != null) {
      final jsonString = Uri(queryParameters: param);
      return jsonString.toString();
    }
    return '';
  }

  dynamic _returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseReturn = jsonDecode(response.body.toString());
        return responseReturn;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(
            'Error occur while communicate with Status Code :${response.statusCode} ');
    }
  }
}
