import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:normas_flutter/models/standard.model.dart';
import 'package:normas_flutter/utils/api_response.dart';
import 'package:normas_flutter/utils/const.dart';
import 'dart:async';

class RegisterStandardApi {
  static Future<ApiResponse<Standard>> registerStandard(
      String nameStandard,
      String descriptionStandard,
      String urlImageStandard,
      List<String> categoriesStandard,
      int idStandard,
      [File fileStandard]) async {
    try {
      print("registerStandard");

      Map paramsRegisterStandard = {
        "normaId": null,
        "nome": nameStandard,
        "descricao": descriptionStandard,
        "url": urlImageStandard,
        "isActive": true,
        "tags": []
      };

      print(paramsRegisterStandard);
      var uri = Uri.parse("${Consts.baseURL}/addNorma");

      var request;
      if (fileStandard == null) {
        print("File Null");
        request = http.MultipartRequest('POST', uri)
          ..headers['Authorization'] = Consts.token
          ..fields['norma'] = json.encode(paramsRegisterStandard);
      } else {
        print("File not Null");
        request = http.MultipartRequest('POST', uri)
          ..headers['Authorization'] = Consts.token
          ..fields['norma'] = json.encode(paramsRegisterStandard)
          ..files.add(await http.MultipartFile.fromPath(
            'file',
            fileStandard.path,
          ));
      }

      var responseRegisterStandard = await request.send();
      print(responseRegisterStandard.statusCode);

      final respStr = await responseRegisterStandard.stream.bytesToString();
      Map mapResponse = json.decode(respStr);

      print(
          'Response RegisterStandard status: ${responseRegisterStandard.statusCode}');
      print('Response RegisterStandard body: $mapResponse');

      if (responseRegisterStandard.statusCode == 200) {
        if (mapResponse["code"] != 0) {
          return ApiResponse.error(mapResponse["msg"]);
        }
        final standard = Standard();

        return ApiResponse.ok(standard, "Norma cadastrada com sucesso");
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro de login > $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
