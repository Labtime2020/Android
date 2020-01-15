import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/forgot_password/forgot_password.api.dart';
import 'package:normas_flutter/pages/forgot_password/forgot_password.store.dart';
import 'package:normas_flutter/utils/api_response.dart';
part 'forgot_password.controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  var userForgotPassword = ForgotPasswordStore();

  String validateEmail() {
    if (userForgotPassword.email == null || userForgotPassword.email.isEmpty) {
      return "Este campo é obrigatorio";
    } else if (EmailValidator.validate(userForgotPassword.email) == false) {
      return "E-mail inválido";
    }
    return null;
  }

  @computed
  bool get forgotIsValid {
    return validateEmail() == null;
  }

  Future<void> onClickForgotPassword() async {
    String email = userForgotPassword.email;

    print("Email: $email");

    ApiResponse response = await ForgotPasswordApi.forgotPassword(email);

    if (response.ok) {
      User user = response.result;
      print(">>> $user");
    } else {
      //alert(context, response.msg);
    }
  }
}
