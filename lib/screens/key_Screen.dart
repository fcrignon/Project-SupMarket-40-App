import 'package:flutter/material.dart';
import 'package:market40Master/constants.dart';
import 'package:market40Master/style/market_40_palette.dart';
import 'package:market40Master/widgets/drawer_menu.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr/qr.dart';

class KeyScreen extends StatelessWidget {
  const KeyScreen(
      {Key key, this.userFirstName, this.userLastName, this.userEmail})
      : super(key: key);

  final String userFirstName;
  final String userLastName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Key'),
        centerTitle: true,
        elevation: 3,
      ),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: kGreenGradient,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Scan your key to enter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: kContainerShadow,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: PrettyQr(
                            //image: AssetImage('assets/images/ic_launcher.png'),
                            typeNumber: 3,
                            elementColor: MarketColors.carbon[800],
                            size: 300,
                            data: 'this is a qr test',
                            errorCorrectLevel: QrErrorCorrectLevel.M,
                            roundEdges: true),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Hello Bob')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
