import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market40Master/services/models/user_model.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';

class DrawerMenu extends StatefulWidget {
  final User user;
  final String currentRoute;

  DrawerMenu({Key key, @required this.user, this.currentRoute})
      : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    String currentRoute = widget.currentRoute;
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
              leading: SvgPicture.asset('assets/icon/qrCodeIconWhite.svg',width: 35,height: 35, color: currentRoute == '/key' ? MarketColors.applegreen[600]: Colors.black87),
              title: Text(
                'Key',
                style: kDrawerTextStyle,
              ),
              selected: currentRoute == '/key',
              onTap: () {
                if (currentRoute == '/key') {
                  Navigator.of(context).pop();
                } else {
                  Navigator.pushNamed(context, '/key', arguments: widget.user);
                }
                return;
              }),
          ListTile(
              leading: Icon(Icons.receipt, size: 35,),
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
              leading: Icon(Icons.settings, size: 35,),
              title: Text(
                'Settings',
                style: kDrawerTextStyle,
              ),
              enabled: false,
              selected: currentRoute == '/setting',
              onTap: () {
                //Navigator.pushNamed(context, '/settings');
              }),
          ListTile(
              leading: Icon(Icons.person, size: 35,),
              title: Text(
                'Profile',
                style: kDrawerTextStyle,
              ),
              enabled: false,
              selected: currentRoute == '/profile',
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
