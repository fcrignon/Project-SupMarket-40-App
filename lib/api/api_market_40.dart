import 'package:market40Master/network/network.dart';

const String apiKey = '';
const String apiUrl = '';

class Market40Api {
  //methode for fetching receipt data
  Future<dynamic> getReceipt() async {
    Network network = Network('$apiUrl$apiKey');
    var receiptsData = await network.getData();
    return receiptsData;
  }

  Future<dynamic> getUser() async {
    Network network = Network('$apiUrl$apiKey');
    var userData = await network.getData();
    return userData;
  }

  Future<dynamic> createUser() async {
    Network network = Network('$apiUrl$apiKey');
    
  }
}
