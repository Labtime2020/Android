import 'package:dio/dio.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String password) async {
    try {
      Dio dio = new Dio();

      dio.options.baseUrl = "${Consts.baseURL}";
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      dio.options.headers['content-Type'] = 'application/json';
      //dio.options.headers["authorization"] = "${Consts.token}";

      Map paramsLogin = {"username": login, "password": password};

      var responseLogin = await dio.post("/login", data: paramsLogin);

      print('Response Login status: ${responseLogin.statusCode}');
      print('Response Login header: ${responseLogin.data}');

      print(responseLogin.headers["authorization"]);

      //Get User Infos
      dio.options.headers["authorization"] =
          responseLogin.headers["authorization"];

      var responseUser = await dio.get("/usuariologado");

      print('Response User status: ${responseUser.statusCode}');
      print('Response User header: ${responseUser.data}');

      if (responseUser.statusCode == 200) {
        final user = User.fromJson(responseUser.data);
        user.save();

        return ApiResponse.ok(user, "Cadastrado com sucesso");
      }

      return ApiResponse.error(responseUser.data["error"]);
      //return ApiResponse.error("Não foi possível .");
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
