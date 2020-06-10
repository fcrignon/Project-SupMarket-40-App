import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market40Master/constants.dart';
import 'package:market40Master/models/user_model.dart';

class DrawerMenu extends StatefulWidget {
  final User user;

  DrawerMenu({Key key, @required this.user}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}
//TODO check why selected is not working
class _DrawerMenuState extends State<DrawerMenu> {
//use to get the current route
  String getCurrentRouteName(context) {
    String currentRouteName;

    Navigator.popUntil(context, (route) {
      currentRouteName = route.settings.name;
      return true;
    });
    return currentRouteName;
  }

  @override
  Widget build(BuildContext context) {
    String currentRoute = getCurrentRouteName(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "${widget.user.firstname} ${widget.user.lastname}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "${widget.user.email}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.nfc),
              title: Text(
                'Key',
                style: kDrawerTextStyle,
              ),
              selected: currentRoute == '/key',
              onTap: () {
                if (currentRoute == '/key') {
                  Navigator.of(context).pop();
                } else {
                   Navigator.pushNamed(context, '/key',  arguments: widget.user);
                }
                return;
              }),
          ListTile(
              leading: Icon(Icons.receipt),
              title: Text(
                'Receipt',
                style: kDrawerTextStyle,
              ),
              selected: currentRoute == '/receipt',
              onTap: () {
                if (currentRoute == '/receipt') {
                  Navigator.of(context).pop();
                } else {
                  Navigator.popAndPushNamed(context, '/receipt',
                  arguments: widget.user);
                }
                return;
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/settings');
              }),
          ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: kDrawerTextStyle,
              ),
              selected: currentRoute == 'profile',
              onTap: () {
                //Navigator.pushNamed(context, '/Profile');
              }),
          ListTile(
              title: Text(
                'Sign out',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                FlutterSecureStorage().deleteAll();
                Navigator.popAndPushNamed(context, '/');
              }),
        ],
      ),
    );
  }
}
