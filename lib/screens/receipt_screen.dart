import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market40Master/services/models/receipt_model.dart';
import 'package:market40Master/services/models/user_model.dart';
import 'package:market40Master/services/network/api_market_40.dart';
import 'package:async/async.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';
import 'package:market40Master/widgets/drawer_menu.dart';
import 'package:market40Master/widgets/empty_cart.dart';
import 'package:market40Master/widgets/receipt_widget.dart';

class ReceiptScreen extends StatefulWidget {
  final User user;

  const ReceiptScreen({Key key, @required this.user}) : super(key: key);
  @override
  _ReceiptScreen createState() => _ReceiptScreen();
}

class _ReceiptScreen extends State<ReceiptScreen> {
  ReceiptList receiptList = ReceiptList();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  bool isNull = true;

  Future getReceipts() {
    return this._memoizer.runOnce(() async {
      var data = await Market40Api().fetchReceipts();
      var receiptMap = json.decode(data);
      receiptList = ReceiptList.fromJson(receiptMap);
      return receiptList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Receipts'),
        centerTitle: true,
        elevation: 3,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/key', arguments: widget.user);
              },
              child: SvgPicture.asset(
                'assets/icon/qrCodeIconWhite.svg',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(
        user: widget.user,
        currentRoute: '/receipt',
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Market40Api().createReceipt();
           var data = await Market40Api().fetchReceipts();
      var receiptMap = json.decode(data);
          print(data);
          print(receiptMap);
         setState(() => receiptList = ReceiptList.fromJson(receiptMap));
        },
        label: Text('Simulate new receipt'),
        icon: Icon(Icons.add),
        backgroundColor: MarketColors.rederror[600],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: kGreenGradient,
        ),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: FutureBuilder(
            future: getReceipts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('snap  : ${snapshot.data}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  print('hello');
                  return Center(child: CircularProgressIndicator());
                default:
                  //return Center(child: Text(snapshot.data.toString())
                  if (snapshot.data == null) {
                    print('project snapshot null data is: ${snapshot.data}');
                    return EmptyList();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    print('snap 2 : ${snapshot.data}');
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Container(
                            height: 40,
                            decoration: kContainerStyle,
                            child: Center(
                              child: Text('Touch the Receipt to get details.',
                                  style: kTitleTextStyleGreen),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,                        
                            shrinkWrap: true,
                            itemCount: (receiptList == null ||
                                    receiptList.receipts == null ||
                                    receiptList.receipts.length == 0)
                                ? 0
                                : receiptList.receipts.length,
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (BuildContext context, int index) {
                              Receipt receipt = receiptList.receipts[index];
                              return ReceiptCard(
                                receipt: receipt,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
              }
            }),
      ),
    );
  }
}
