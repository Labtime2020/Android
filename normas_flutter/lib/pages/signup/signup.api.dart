import 'dart:io';

import 'package:dio/dio.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class SignUpApi {
  static Future<ApiResponse<User>> signUp(String email, String name,
      String lastname, String password, bool isAdmin, File imagePath) async {
    try {
      String path = imagePath.path;
      var pathImage = path.substring(path.indexOf("/") + 1, path.length);
      var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
      print(path);
      Dio dio = new Dio();

      dio.options.baseUrl = "${Consts.baseURL}";
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      //dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      FormData formData = FormData.fromMap({
        "usuario": {
          "email": email,
          "nome": name,
          "sobrenome": lastname,
          "password": password,
          "isAdmin": isAdmin
        },
        "file": await MultipartFile.fromFile(imagePath.path,
            filename: "profile_image.jpg")
      });

      var responseSignUp = await dio.post("/info", data: formData);

      print('Response SignUp status: ${responseSignUp.statusCode}');
      print('Response SignUp body: ${responseSignUp.data}');

      print(responseSignUp.data["msg"]);

      if (responseSignUp.statusCode == 2000) {
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

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(responseSignUp.data["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
