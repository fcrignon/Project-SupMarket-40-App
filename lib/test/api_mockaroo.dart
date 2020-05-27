import 'package:market40Master/network/network.dart';

const String apiKey = '57b2f650';
const String mockarooAPI = 'https://my.api.mockaroo.com/receipts.json';

const String apiKeyString = '?key=$apiKey';

class MockarooAPI {
  // Future<dynamic> getUser() async {
  //   Network network = Network('$mockarooAPI$apiKeyString');
  //   var userData = await network.getData();
  //   return userData;
  // }
  Future<dynamic> getReceipts() async {
    Network network = Network('$mockarooAPI$apiKeyString');
    var receiptsData = await network.getData();
    return receiptsData;
  }
  
 
}