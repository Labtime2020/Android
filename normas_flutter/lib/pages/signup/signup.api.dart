import 'dart:convert';
import 'dart:io';

import 'package:normas_flutter/models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class SignUpApi {
  static Future<ApiResponse<User>> signUp(
      String email, String name, String lastname, String password, bool isAdmin,
      [File imagePath]) async {
    try {
      Map paramsSignUp = {
        "email": email,
        "nome": name,
        "sobrenome": lastname,
        "password": password,
        "isAdmin": isAdmin
      };

      var uri = Uri.parse("${Consts.baseURL}/cadastrar");

      var request;
      if (imagePath == null) {
        request = http.MultipartRequest('POST', uri)
          ..fields['usuario'] = json.encode(paramsSignUp);
      } else {
        request = http.MultipartRequest('POST', uri)
          ..fields['usuario'] = json.encode(paramsSignUp)
          ..files.add(await http.MultipartFile.fromPath(
            'file',
            imagePath.path,
          ));
      }

      var responseSignUp = await request.send();
      print(responseSignUp.statusCode);

      final respStr = await responseSignUp.stream.bytesToString();
      Map mapResponse = json.decode(respStr);

      print('Response Map code: ${mapResponse["code"]}');
      print('Response Map msg: ${mapResponse["msg"]}');

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

        return ApiResponse.ok(user, "Cadastrado com sucesso");
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
