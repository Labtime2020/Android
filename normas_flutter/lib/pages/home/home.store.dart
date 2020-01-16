import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/standards.model.dart';
part 'home.store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  Standards standards;
}
