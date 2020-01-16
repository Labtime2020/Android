import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.controller.dart';

class FloatingButtonUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return FloatingActionButton(
      child: Icon(Icons.keyboard_arrow_up),
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        controller.scrollController.animateTo(
            controller.scrollController.initialScrollOffset,
            curve: Curves.linear,
            duration: Duration(milliseconds: 500));
      },
    );
  }
}
