import 'package:dio/dio.dart';
import 'package:normas_flutter/models/standards.model.dart';
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class HomeApi {
  static Future<ApiResponse<Standards>> getStandards() async {
    try {
      Dio dio = Dio();

      dio.options.baseUrl = "${Consts.baseURL}";
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "${Consts.token}";

      var responseStandard = await dio.get("/buscarnormas");

      print('Response User status: ${responseStandard.statusCode}');
      //print('Response User body: ${responseStandard.data}');

      print(responseStandard.data[0]);

      if (responseStandard.statusCode == 200) {
        final standards = Standards.fromJson(responseStandard.data);

        return ApiResponse.ok(standards, "Normas: Get Sucess");
      }

      //return ApiResponse.error(responseStandard.data["error"]);
      return ApiResponse.error("Não foi possível .");
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
