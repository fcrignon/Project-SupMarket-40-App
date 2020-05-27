import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market40Master/test/api_mockaroo.dart';
import 'package:market40Master/test/receipt_model.dart';
import 'package:market40Master/widgets/drawer_menu.dart';
import 'package:market40Master/widgets/empty_cart.dart';
import 'package:market40Master/widgets/receipt_widget.dart';

import '../constants.dart';

//TODO build splash screen for waiting data

class ReceiptScreen extends StatefulWidget {
  @override
  _ReceiptScreen createState() => _ReceiptScreen();
}

class _ReceiptScreen extends State<ReceiptScreen> {
  ReceiptList receiptList = ReceiptList();
  bool isNull = true;

  void getReceiptData() async {
    String data = await MockarooAPI().getReceipts();
    var receiptMap = json.decode(data);
    if (data == null) {
      isNull = true;
    } else {
      isNull = false;
      setState(() => receiptList = ReceiptList.fromJson(receiptMap));
    }
  }

  @override
  void initState() {
    super.initState();
    getReceiptData();
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
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/key');
              },
              child: Icon(Icons.nfc),
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: kGreenGradient,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('Touch the Receipt to get details.', style: TextStyle(color: Colors.white, fontSize:22, )),
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
            )
          ],
        ),
      ),
    );
  }
}
