import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:market40Master/api/api_market_40.dart';
import 'package:market40Master/models/user_model.dart';
import 'package:market40Master/style/market_40_palette.dart';
import 'package:market40Master/test/api_mockaroo.dart';
import 'package:market40Master/test/receipt_model.dart';
import 'package:market40Master/widgets/drawer_menu.dart';
import 'package:market40Master/widgets/empty_cart.dart';
import 'package:market40Master/widgets/receipt_widget.dart';
import '../constants.dart';

//TODO build splash screen for waiting data

class ReceiptScreen extends StatefulWidget {
  final User user;

  const ReceiptScreen({Key key, @required this.user}) : super(key: key);
  @override
  _ReceiptScreen createState() => _ReceiptScreen();
}

class _ReceiptScreen extends State<ReceiptScreen> {
  ReceiptList receiptList = ReceiptList();
  bool isNull = true;

  // void getReceiptData() async {
  //   var data = await MockarooAPI().getReceipts();
  //   var receiptMap = json.decode(data);
  //   if (data == null) {
  //     isNull = true;
  //   } else {
  //     isNull = false;
  //     setState(() => receiptList = ReceiptList.fromJson(receiptMap));
  //   }
  // }

  void getReceiptsData() async {
    var data = await Market40Api().fetchReceipts();
    var receiptMap = json.decode(data);
    if (data == null) {
      isNull == true;
    } else {
      isNull = false;
      setState(() => receiptList = ReceiptList.fromJson(receiptMap));
    }
  }

  @override
  void initState() {
    super.initState();
    //getReceiptData();
    getReceiptsData();
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
              child: Icon(Icons.nfc),
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(
        user: widget.user,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var data = await Market40Api().createReceipt();
          var receiptMap = json.decode(data);
          setState(() {
            isNull = false;
            receiptList = ReceiptList.fromJson(receiptMap);
          });
        },
        label: Text('Create new receipt'),
        icon: Icon(Icons.add),
        backgroundColor: MarketColors.rederror[600],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: kGreenGradient,
        ),
        padding: EdgeInsets.all(20),
        child: isNull
            ? EmptyList()
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Touch the Receipt to get details.',
                        style: kTitleTextStyle),
                  ),
                  //TODO build futur buider
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
              ),
      ),
    );
  }
}
