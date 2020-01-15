import 'dart:io';

import 'package:dio/dio.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class SignUpApi {
  static Future<ApiResponse<User>> signUp(String email, String name,
      String lastname, String password, bool isAdmin, File imagePath) async {
    try {
      String path = imagePath.path;
      // var pathImage = path.substring(path.indexOf("/") + 1, path.length);
      // var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
      print(path);
      Dio dio = new Dio();

      dio.options.baseUrl = "${Consts.baseURL}";
      dio.options.connectTimeout = 10000;
      dio.options.receiveTimeout = 7000;
      //dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imagePath.path,
            filename: "profile_image.jpg"),
        "usuario": {
          "email": email,
          "nome": name,
          "sobrenome": lastname,
          "password": password,
          "isAdmin": isAdmin
        },
      });
      print(formData.fields);
      var responseSignUp = await dio.post("/cadastrar", data: formData);

      print('Response SignUp status: ${responseSignUp.statusCode}');
      print('Response SignUp body: ${responseSignUp.data}');

      print(responseSignUp.data["msg"]);

      if (responseSignUp.statusCode == 200) {
        if (responseSignUp.data["code"] != 0) {
          return ApiResponse.error(responseSignUp.data["msg"]);
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

      return ApiResponse.error(responseSignUp.data["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
