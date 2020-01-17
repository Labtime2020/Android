import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/home/widgets/card_item_standard.home.widget.dart';
import 'package:provider/provider.dart';

import '../home.controller.dart';

class ListStandard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: controller.homeStore.standards == null
              ? Container(
                  height: 0,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.homeStore.standards.standards.length,
                  itemBuilder: (BuildContext ctxt, int index) => Observer(
                    builder: (_) {
                      return CardItemStandard(
                          controller.homeStore.standards.standards[index]
                              .nameStandard,
                          controller.homeStore.standards.standards[index]
                              .descriptionStandard,
                          controller.homeStore.standards.standards[index].views,
                          controller.homeStore.standards.standards[index]
                              .categoriesStandard,
                          index);
                    },
                  ),
                ),
        );
      },
    );
  }
}
