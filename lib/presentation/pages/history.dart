import 'package:flutter/material.dart';
import 'package:startup_namer/presentation/widget/app_drawer.dart';

class HistoryPage extends StatelessWidget {
  static const String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("History")));
  }
}