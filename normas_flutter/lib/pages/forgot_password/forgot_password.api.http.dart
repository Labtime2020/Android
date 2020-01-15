import 'dart:convert';

import 'package:normas_flutter/models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class ForgotPasswordApi {
  static Future<ApiResponse<User>> forgotPassword(String email) async {
    try {
      var urlForgotPassword = '${Consts.baseURL}/recuperarsenha';

      Map<String, String> headersLogin = {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJSYWZhZWxjcyIsImV4cCI6MTU3ODI0MTk2M30.B9nucyV1wZ2r8KSLsU-2HtjDs41b5GYfPIY8tFA2NERB0OL24SRZCa-NJAs6EWVA4sJnpCmePYxnKA6hzzVbTA"
      };
      String paramsForgot = email;

      var responseLogin = await http.post(urlForgotPassword,
          body: paramsForgot, headers: headersLogin);

      print('Response Login status: ${responseLogin.statusCode}');
      print('Response Login body: ${responseLogin.body}');

      Map mapResponse = json.decode(responseLogin.body);

      // if (responseUser.statusCode == 200) {
      //   final user = User.fromJson(mapResponse);
      //   user.save();

      //   return ApiResponse.ok(user);
      // }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
