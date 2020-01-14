import 'dart:convert';

import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/const.dart';
import 'dart:async';

class RegisterStandardApi {
  static Future<ApiResponse<User>> registerStandard(
      String nameStandard,
      String descriptionStandard,
      String urlImageStandard,
      List<String> categoriesStandard,
      String idStandard) async {
    try {
      var urlRegisterStandard = '${Consts.baseURL}/registrarnorma';

      Map<String, String> headersLogin = {"Content-Type": "application/json"};
      Map paramsRegisterStandard = {
        "nome": nameStandard,
        "descricao": descriptionStandard,
        "url": urlImageStandard,
        "categorias": categoriesStandard,
        "id": idStandard
      };

      String responseBody = json.encode(paramsRegisterStandard);

      var responseRegisterStandard = await http.post(urlRegisterStandard,
          body: responseBody, headers: headersLogin);

      print(
          'Response RegisterStandard status: ${responseRegisterStandard.statusCode}');
      print('Response RegisterStandard body: ${responseRegisterStandard.body}');

      Map mapResponse = json.decode(responseRegisterStandard.body);

      print('Response Map body: ${mapResponse["code"]}');

      // if (responseRegisterStandard.statusCode == 200) {
      //   if (mapResponse["code"] != 0) {
      //     return ApiResponse.error(mapResponse["msg"]);
      //   }

      //   Map<String, String> userSignUpConfirmed = {
      //     "nome": "$name",
      //     "email": "$email",
      //     "password": "$password"
      //   };
      //   final user = User.fromJson(userSignUpConfirmed);
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
