import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';
import 'package:provider/provider.dart';

import 'home.controller.dart';
import 'widgets/filter.home.widget.dart';
import 'widgets/floating_button.home.widget.dart';
import 'widgets/landing.home.widget.dart';
import 'widgets/list_standard.home.widget.dart';
import 'widgets/search.home.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    _controller.fetchList();

    Future<Null> _handleRefresh() async {
      await _controller.fetchList();

      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset(
            "assets/logo/logo-small-white.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Color(0xFF006CD0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget(context),
      floatingActionButton: FloatingButtonUp(),
      body: Container(
        color: Color(0xFFF2F2F2),
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller.scrollController,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Landing(),
                  SearchStandard(),
                  FilterStandard(),
                  ListStandard(),
                  FooterWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
