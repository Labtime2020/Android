import 'dart:io';

import 'package:mobx/mobx.dart';
part 'signup.store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  File image;
  @action
  changeImage(File value) => image = value;

  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String lastname;
  @action
  changeLastName(String value) => lastname = value;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String password;
  @action
  changePassword(String value) => password = value;

  @observable
  String passwordConfirm;
  @action
  changePasswordConfirm(String value) => passwordConfirm = value;

  @observable
  bool isAdmin = false;
  @action
  changeIsAdmin(bool value) => isAdmin = value;
}
