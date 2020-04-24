import 'package:flutter/material.dart';
import 'package:startup_namer/presentation/widget/app_drawer.dart';
import 'package:startup_namer/presentation/widget/custom_shape_cliper.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Home Page')),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeCliper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.orange,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

