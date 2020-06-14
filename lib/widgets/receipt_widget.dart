import 'package:flutter/material.dart';
import 'package:market40Master/services/calc_price.dart';
import 'package:market40Master/services/models/receipt_model.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';

class ReceiptCard extends StatefulWidget {
  const ReceiptCard({Key key, this.receipt}) : super(key: key);

  final Receipt receipt;

  @override
  _ReceiptWidgetState createState() => _ReceiptWidgetState();
}

class _ReceiptWidgetState extends State<ReceiptCard> {
  List<double> itemsPriceList = [];
  int tax = 10;
  double totalPriceWithTax;
  double taxPrice;
  CalcPrices calcPrices = CalcPrices();
  int tQTY = 0;
  bool isVisible = false;

  void showWidget() {
    setState(() {
      isVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      isVisible = false;
    });
  }

  void getListPrices() {
    for (var i = 0; i < widget.receipt.items.length; i++) {
      itemsPriceList.add(calcPrices.getTotalItemsPrices(
          widget.receipt.items[i].quantity, widget.receipt.items[i].price));
    }
    double totalprice = calcPrices.getTotalPrice(itemsPriceList);
    taxPrice = calcPrices.getTaxPrice(tax, totalprice);
    totalPriceWithTax = calcPrices.getTotalPriceWithTax(taxPrice, totalprice);
  }

  void getTotalItemsQTY() {
    for (var i = 0; i < widget.receipt.items.length; i++) {
      tQTY = tQTY + widget.receipt.items[i].quantity;
    }
  }

  @override
  void initState() {
    super.initState();
    getListPrices();
    getTotalItemsQTY();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isVisible ? hideWidget() : showWidget(),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15),
                  child: Text(
                    'Receipt #${widget.receipt.receiptId}',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.2),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Date: ${widget.receipt.receiptDate.day}/${widget.receipt.receiptDate.month}/${widget.receipt.receiptDate.year} at ${widget.receipt.receiptDate.hour} : ${widget.receipt.receiptDate.minute}',
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Store: ${widget.receipt.storeLocation.city}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(widget.receipt.storeLocation.address,
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3.0,
              color: MarketColors.applegreen[600],
              indent: 10,
              endIndent: 10,
            ),
            Visibility(
              visible: isVisible,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Qty',
                            style: kTableTitleTextStyle,
                          ),
                          Text(
                            'Description',
                            style: kTableTitleTextStyle,
                          ),
                          Text(
                            'Price',
                            style: kTableTitleTextStyle,
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                      getDetailReceipt(widget.receipt.items, itemsPriceList),
                      Divider(
                        thickness: 3.0,
                        color: MarketColors.applegreen[600],
                   
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Items Sold : $tQTY',
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Tax:    ',
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 1.2),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${taxPrice.toStringAsFixed(2)} €',
                          style: kTotalPriceTextStyle,
                        )
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Total: ',
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 1.2),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${totalPriceWithTax.toStringAsFixed(2)} €',
                            style: kTotalPriceTextStyle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//widget with detailed list of items
Widget getDetailReceipt(List<Item> items, List<double> itemsPriceList) {
  List<Widget> detailedList = List<Widget>();
  for (var i = 0; i < items.length; i++) {
    detailedList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            items[i].quantity.toString(),
            style: kTableItemsTextStyle,
          ),
          Text(
            items[i].itemName,
            style: kTableItemsTextStyle,
            textAlign: TextAlign.right,
          ),
          Text(
            itemsPriceList[i].toStringAsFixed(2),
            style: kTableItemsTextStyle,
          )
        ],
      ),
    );
  }
  return Column(
    children: detailedList,
  );
}
