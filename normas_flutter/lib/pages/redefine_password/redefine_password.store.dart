import 'package:mobx/mobx.dart';
part 'redefine_password.store.g.dart';

class RedefinePasswordStore = _RedefinePasswordStoreBase
    with _$RedefinePasswordStore;

abstract class _RedefinePasswordStoreBase with Store {
  @observable
  String password;
  @action
  changePassword(String value) => password = value;

  @observable
  String passwordConfirm;
  @action
  changePasswordConfirm(String value) => passwordConfirm = value;
}
