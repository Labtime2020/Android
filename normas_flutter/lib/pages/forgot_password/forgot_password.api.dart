import 'package:dio/dio.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class ForgotPasswordApi {
  static Future<ApiResponse<User>> forgotPassword(String email) async {
    try {
      Dio dio = new Dio();

      dio.options.baseUrl = "${Consts.baseURL}";
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "${Consts.token}";

      var responseForgot = await dio.post("/recuperarsenha", data: email);

      print('Response Login status: ${responseForgot.statusCode}');
      print('Response Login body: ${responseForgot.data}');

      print(responseForgot.data["msg"]);

      // if (responseUser.statusCode == 200) {
      //   final user = User.fromJson(mapResponse);
      //   user.save();

      //   return ApiResponse.ok(user);
      // }

      //return ApiResponse.error(mapResponse["error"]);
      return ApiResponse.error("error");
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
