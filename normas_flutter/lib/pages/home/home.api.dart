import 'dart:convert';

import 'package:normas_flutter/models/standards.model.dart';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';

class HomeApi {
  static Future<ApiResponse<Standards>> getStandards() async {
    try {
      var urlStandards = '${Consts.baseURL}/buscarnormas';

      Map<String, String> headersUser = {"Authorization": Consts.token};

      var responseStandard = await http.get(urlStandards, headers: headersUser);

      print('Response getStandards status: ${responseStandard.statusCode}');
      //print('Response User body: ${responseUser.body}');

      List mapResponse = json.decode(responseStandard.body);

      if (responseStandard.statusCode == 200) {
        final user = Standards.fromJson(mapResponse);

        return ApiResponse.ok(user, "Get standard list with sucess");
      }

      return ApiResponse.error(
          "Error getting standards list: code $responseStandard.statusCode");
    } catch (error, exception) {
      print("Erro getStandards > $error > $exception");

      return ApiResponse.error("Error getting standards list");
    }
  }
}
