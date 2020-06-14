import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market40Master/services/models/receipt_model.dart';
import 'package:market40Master/services/models/user_model.dart';
import 'package:market40Master/services/network/api_market_40.dart';
import 'package:async/async.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';
import 'package:market40Master/widgets/custom_alert_dialogue.dart';
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

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => CustomAlertDialogue(
            label: title,
            content: text,
          ));

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
          var res = await Market40Api().createReceipt();
          if (res == 201) {
            var data = await Market40Api().fetchReceipts();
            var receiptMap = json.decode(data);
            setState(() => receiptList = ReceiptList.fromJson(receiptMap));
          } else{
            displayDialog(context, "Error",
                                    "Failled to create new receipt 500. Please try again. ");
          }
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
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.data == null) {                 
                    return EmptyList();
                  }
                  return ReceiptListBuilder(receiptList: receiptList);
                default:
                  if (snapshot.data == null) {
                    return EmptyList();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return ReceiptListBuilder(receiptList: receiptList);
                  }
              }
            }),
      ),
    );
  }
}

// widget for drawing all receips
class ReceiptListBuilder extends StatelessWidget {
  const ReceiptListBuilder({
    Key key,
    @required this.receiptList,
  }) : super(key: key);

  final ReceiptList receiptList;

  @override
  Widget build(BuildContext context) {
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
