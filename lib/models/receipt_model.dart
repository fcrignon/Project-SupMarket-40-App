import 'package:json_annotation/json_annotation.dart';
part 'receipt_model.g.dart';

//schema of the receipt
@JsonSerializable(explicitToJson: true)
class Receipt {
  final String receiptId;
  final DateTime receiptDate;
  final double totalPrice;
  final List<Item> items;
  final StoreLocation storeLocation;
  final String receiptHours;

  Receipt(
      {this.items,
      this.receiptDate,
      this.receiptHours,
      this.receiptId,
      this.storeLocation,
      this.totalPrice});

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptToJson((this));
}

//schema of the receipts list
//@JsonSerializable()
class ReceiptList {
  List<Receipt> receipts;

  ReceiptList({this.receipts});

  // factory ReceiptList.fromJson(Map<String, dynamic> json)=> _$ReceiptListFromJson(json);

  // Map<String, dynamic> toJson() => _$ReceiptListToJson((this));
  factory ReceiptList.fromJson(List<dynamic> json) {
    return ReceiptList(
        receipts: json
            .map((e) => Receipt.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

//schema of the Items list
// @JsonSerializable()
class ItemsList {
  final List<Item> items;

  ItemsList({this.items});

  factory ItemsList.fromJson(List<dynamic> json) {
    return ItemsList(
        items:
            json.map((e) => Item.fromJson(e as Map<String, dynamic>)).toList());
  }
}

//Schema of the Item
@JsonSerializable()
class Item extends Object {
  String itemName;
  int quantity;
  double price;
  String itemId;

  Item({this.itemName, this.quantity, this.price, this.itemId});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class StoreLocation {
  final String city;
  final String address;

  StoreLocation({this.city, this.address});

  factory StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationFromJson(json);

  Map<String, dynamic> toJson() => _$StoreLocationToJson(this);
}
