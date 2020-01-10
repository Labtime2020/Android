import 'dart:convert';

import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    try {
      var urlLogin = 'http://192.168.1.227:9090/login';

      Map<String, String> headersLogin = {"Content-Type": "application/json"};
      Map paramsLogin = {"username": login, "password": senha};

      String responseBody = json.encode(paramsLogin);

      var responseLogin =
          await http.post(urlLogin, body: responseBody, headers: headersLogin);

      print('Response Login status: ${responseLogin.statusCode}');
      print('Response Login header: ${responseLogin.headers['authorization']}');

      ///////////

      var urlUser = 'http://192.168.1.227:9090/usuariologado';

      Map<String, String> headersUser = {
        "Authorization": responseLogin.headers['authorization']
      };

      var responseUser = await http.get(urlUser, headers: headersUser);

      print('Response User status: ${responseUser.statusCode}');
      print('Response User header: ${responseUser.body}');

      Map mapResponse = json.decode(responseUser.body);

      if (responseUser.statusCode == 200) {
        final user = User.fromJson(mapResponse);
        user.save();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
