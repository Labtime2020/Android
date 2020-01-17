import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.controller.dart';

class SearchStandard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Visibility(
      visible: (controller.homeStore.standards != null),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          controller: controller.searchController,
          style: TextStyle(
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: "Buscar norma",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () => controller.clearSearch(),
              icon: Icon(Icons.clear),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
