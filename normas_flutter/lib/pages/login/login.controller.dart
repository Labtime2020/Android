import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:normas_flutter/pages/login/login.api.dart';
import 'package:normas_flutter/pages/login/login.store.dart';
part 'login.controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var user = LoginStore();

  @computed
  bool get isValid {
    return validateEmail() == null && validateSenha() == null;
  }

  String validateSenha() {
    if (user.senha == null || user.senha.isEmpty) {
      return "Este campo é obrigatorio";
    }
    return null;
  }

  String validateEmail() {
    if (user.email == null || user.email.isEmpty) {
      return "Este campo é obrigatorio";
    } else if (EmailValidator.validate(user.email) == false) {
      return "E-mail inválido";
    }
    return null;
  }

  Future<void> onClickLogin() async {
    String login = user.email;
    String senha = user.senha;

    print("Login: $login, Senha: $senha");

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      User user = response.result;
      print(">>> $user");
    } else {
      //alert(context, response.msg);
    }
  }
}
