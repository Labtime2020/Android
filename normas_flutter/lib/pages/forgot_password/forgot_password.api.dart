import 'dart:convert';

import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/const.dart';

class ForgotPasswordApi {
  static Future<ApiResponse<User>> forgotPassword(String email) async {
    try {
      var urlForgotPassword = '${Consts.baseURL}/ESQUECERSENHA';

      Map<String, String> headersLogin = {"Content-Type": "application/json"};
      Map paramsForgot = {"username": email};

      String responseBody = json.encode(paramsForgot);

      var responseLogin = await http.post(urlForgotPassword,
          body: responseBody, headers: headersLogin);

      print('Response Login status: ${responseLogin.statusCode}');
      print('Response Login header: ${responseLogin.headers['authorization']}');

      ///////////

      var urlUser = '${Consts.baseURL}/usuariologado';

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
