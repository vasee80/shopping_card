import 'package:flutter/material.dart';
import 'package:startup_namer/presentation/pages/routes.dart';

class AppDrawer extends StatelessWidget {
  
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/drawer_header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("My Scan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.home),
            ),
            _createDrawerItem(
              icon: Icons.event,
              text: 'Events',
              onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.events),
            ),
            _createDrawerItem(
              icon: Icons.contacts,
              text: 'Contact List',
              onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.contacts),
            ),
            _createDrawerItem(
              icon: Icons.history,
              text: 'History',
              onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.history),
            ),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Setting',
            ),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
    );
  }
}