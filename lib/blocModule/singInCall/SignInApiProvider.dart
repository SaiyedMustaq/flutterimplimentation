import 'dart:io';

import 'package:lazy_loading_listview/blocModule/ErrorHandle.dart';
import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_loading_listview/blocModule/singInCall/SignInRequest.dart';
import 'package:lazy_loading_listview/networkModule/APIExceptions.dart';

class SignInApiProvider {
  var signInResponse;
  var socialSignInResponse;

  Future signIn(/*LoginRequest loginRequest*/name,password) async {
    var request = Map<String, dynamic>();
    request["email"] = name.trim();
    request["password"] = password.trim();
    print('Sing Request $request');

    try {
      var response = await http.post(
        "http://synergy.imperoserver.in/api/login",
        body: request,
        headers: {"Accept": "application/json"},
      );
      print("Response   " + response.statusCode.toString());
      signInResponse =
          ErrorHandle.returnResponse(response, signInResponseFromJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print('ERROR $e');
    }

    return signInResponse;
  }
}
