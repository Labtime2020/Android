import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/standards.model.dart';
import 'package:normas_flutter/pages/home/home.api.dart';
import 'package:normas_flutter/pages/home/home.store.dart';
import 'package:normas_flutter/utils/api_response.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  TextEditingController searchController = TextEditingController();
  @observable
  ScrollController scrollController = ScrollController();

  var homeStore = HomeStore();

  @action
  fetchList() {
    initGetStandards().then(
      (standardsResult) {
        homeStore.standards = standardsResult;
      },
    );
  }

  void validateSearch(String aux) {
    if (searchController.text.isNotEmpty) {
      print(searchController.text);
    }

    return null;
  }

  void clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => searchController.clear());
  }

  Future<Standards> initGetStandards() async {
    ApiResponse response = await HomeApi.getStandards();

    if (response.ok) {
      Standards standardsAux = response.result;

      return standardsAux;
    } else {
      return null;
    }
  }
}
