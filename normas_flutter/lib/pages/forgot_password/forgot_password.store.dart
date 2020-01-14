import 'package:mobx/mobx.dart';
part 'forgot_password.store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  @observable
  String email;
  @action
  changeEmail(String value) => email = value;
}
