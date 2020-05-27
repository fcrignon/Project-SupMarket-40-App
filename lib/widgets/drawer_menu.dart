import 'package:flutter/material.dart';
import 'package:market40Master/constants.dart';

//import '../routes/routes.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key key}) : super(key: key);
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

//use to get the current route
  String getCurrentRouteName(context){
    String currentRouteName;

    Navigator.popUntil(context, (route){
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
              accountName: Text("Sponge Bob",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              accountEmail: Text("spongebob@gmail.com",style: TextStyle(fontSize: 18,),),
            ),
            ListTile(
                leading: Icon(Icons.nfc),
                title: Text('Key',style: kDrawerTextStyle,),
                selected: currentRoute == '/key',
                onTap: () {
                  if (currentRoute == '/key') {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.popAndPushNamed(context, '/key');
                  }return;
                }),
            ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Receipt',style: kDrawerTextStyle,),
                selected: currentRoute == '/receipt',
                onTap: () {
                  if (currentRoute == '/receipt') {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.popAndPushNamed(context, '/receipt');
                  }return;
                }),
            Divider(),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings',style: kDrawerTextStyle,),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/settings');
                }),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile',style: kDrawerTextStyle,),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/Profile');
                }),
            ListTile(
                title: Text('Sign out',style: kDrawerTextStyle,),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                }),
          ],
        ),
    );
  }
}
