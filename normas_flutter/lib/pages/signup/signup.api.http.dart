import 'dart:convert';

import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/const.dart';

class SignUpApi {
  static Future<ApiResponse<User>> signUp(String email, String name,
      String lastname, String password, bool isAdmin) async {
    try {
      var urlSignUp = '${Consts.baseURL}/cadastrar';

      Map<String, String> headersLogin = {"Content-Type": "application/json"};
      Map paramsSignUp = {
        "email": email,
        "nome": name,
        "sobrenome": lastname,
        "password": password,
        "isAdmin": isAdmin
      };

      String responseBody = json.encode(paramsSignUp);

      var responseSignUp =
          await http.post(urlSignUp, body: responseBody, headers: headersLogin);

      print('Response SignUp status: ${responseSignUp.statusCode}');
      print('Response SignUp body: ${responseSignUp.body}');

      Map mapResponse = json.decode(responseSignUp.body);

      print('Response Map body: ${mapResponse["code"]}');

      if (responseSignUp.statusCode == 200) {
        if (mapResponse["code"] != 0) {
          return ApiResponse.error(mapResponse["msg"]);
        }

        Map<String, String> userSignUpConfirmed = {
          "nome": "$name",
          "email": "$email",
          "password": "$password"
        };
        final user = User.fromJson(userSignUpConfirmed);
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
