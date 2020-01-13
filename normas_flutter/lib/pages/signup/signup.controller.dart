import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:normas_flutter/pages/signup/signup.api.dart';
import 'package:normas_flutter/pages/signup/signup.store.dart';
import 'package:normas_flutter/utils/alert.dart';
part 'signup.controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  var userSignUp = SignUpStore();

  @computed
  bool get isValidSignUp {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateName() {
    if (userSignUp.name == null || userSignUp.name.isEmpty) {
      return "Este campo é obrigatorio";
    }
    return null;
  }

  String validateLastName() {
    if (userSignUp.lastname == null || userSignUp.lastname.isEmpty) {
      return "Este campo é obrigatorio";
    }
    return null;
  }

  String validateEmail() {
    if (userSignUp.email == null || userSignUp.email.isEmpty) {
      return "Este campo é obrigatorio";
    } else if (EmailValidator.validate(userSignUp.email) == false) {
      return "E-mail inválido";
    }
    return null;
  }

  String validatePassword() {
    if (userSignUp.password == null || userSignUp.password.isEmpty) {
      return "Este campo é obrigatorio";
    }
    // if (!(userSignUp.password.length >= 6 &&
    //     userSignUp.password.length < 15 &&
    //     !userSignUp.password.contains(RegExp(r'\W')))) {
    //   return "Letras e números, de 6 a 15 caracteres";
    // }
    if (userSignUp.password != userSignUp.passwordConfirm) {
      return "Senha não confere";
    }
    return null;
  }

  String validatePasswordConfirm() {
    if (userSignUp.passwordConfirm == null ||
        userSignUp.passwordConfirm.isEmpty) {
      return "Este campo é obrigatorio";
    }
    // if (!(userSignUp.password.length >= 6 &&
    //     userSignUp.password.length < 15 &&
    //     !userSignUp.password.contains(RegExp(r'\W')))) {
    //   return "Letras e números, de 6 a 15 caracteres";
    // }
    if (userSignUp.password != userSignUp.passwordConfirm) {
      return "Senha não confere";
    }
    return null;
  }

  @computed
  bool get signUpIsValid {
    return validateName() == null &&
        validateLastName() == null &&
        validateEmail() == null &&
        validatePassword() == null &&
        validatePasswordConfirm() == null;
  }

  Future<void> onClickSignUp(BuildContext context) async {
    String email = userSignUp.email;
    String name = userSignUp.name;
    String lastname = userSignUp.lastname;
    String password = userSignUp.password;
    bool isAdmin = userSignUp.isAdmin;

    print(
        "Login: $email, Name: $name, Lastname: $lastname, Password: $password, isAdmin: $isAdmin");

    ApiResponse response =
        await SignUpApi.signUp(email, name, lastname, password, isAdmin);

    if (response.ok) {
      //User userSignUp = response.result;
      //print(">>> $userSignUp");
    } else {
      alert(context, response.msg, "Cadastrar");
    }
  }
}
