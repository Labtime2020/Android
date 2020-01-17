import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/app_bar.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';
import 'package:provider/provider.dart';

import 'home.controller.dart';
import 'widgets/filter.home.widget.dart';
import 'widgets/landing.home.widget.dart';
import 'widgets/list_standard.home.widget.dart';
import 'widgets/search.home.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarStandard(
      appBody: homePage(context),
    );
  }

  Widget homePage(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    _controller.fetchList();

    Future<Null> _handleRefresh() async {
      await _controller.fetchList();

      return null;
    }

    return Container(
      color: Color(0xFFF2F2F2),
      // color: Colors.black,
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          shrinkWrap: false,
          itemExtent: MediaQuery.of(context).size.height - kToolbarHeight,
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller.scrollController,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
