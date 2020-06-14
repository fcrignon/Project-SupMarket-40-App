// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    receiptDate: json['receiptDate'] == null
        ? null
        : DateTime.parse(json['receiptDate'] as String),
    receiptHours: json['receiptHours'] as String,
    receiptId: json['receiptId'] as String,
    storeLocation: json['storeLocation'] == null
        ? null
        : StoreLocation.fromJson(json['storeLocation'] as Map<String, dynamic>),
    totalPrice: json['totalPrice'] as String,
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'receiptId': instance.receiptId,
      'receiptDate': instance.receiptDate?.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'storeLocation': instance.storeLocation?.toJson(),
      'receiptHours': instance.receiptHours,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    itemName: json['itemName'] as String,
    quantity: json['quantity'] as int,
    price: (json['price'] as num)?.toDouble(),
    itemId: json['itemId'] as String,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'price': instance.price,
      'itemId': instance.itemId,
    };

StoreLocation _$StoreLocationFromJson(Map<String, dynamic> json) {
  return StoreLocation(
    city: json['city'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$StoreLocationToJson(StoreLocation instance) =>
    <String, dynamic>{
      'city': instance.city,
      'address': instance.address,
    };
