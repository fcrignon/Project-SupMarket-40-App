import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market40Master/network/network.dart';

const String ip = '10.0.2.2';
const String port = '3000';
const String apiUrl = 'http://$ip:$port/api';

class Market40Api {
//methode for simulate a receipt for the user 
  Future<dynamic> createReceipt() async {
    String userId = await FlutterSecureStorage().read(key: 'id');
    Network network = Network('$apiUrl/public/transactions/generate/$userId');
    String jwt = await FlutterSecureStorage().read(key: 'jwt');
    var receiptsData = await network.fetchData(jwt);
    return receiptsData;
  }

//methode for fetching receipt data
  Future<dynamic> fetchReceipts() async {
    String userId = await FlutterSecureStorage().read(key: 'id');
    Network network = Network('$apiUrl/public/transactions/$userId');
    String jwt = await FlutterSecureStorage().read(key: 'jwt');
    var receiptsData = await network.fetchData(jwt);
    return receiptsData;
  }

//methode for fetching user data
  Future<dynamic> fetchUserData() async {
    String userId = await FlutterSecureStorage().read(key: 'id');
    print(userId);
    Network network = Network('$apiUrl/public/customer/$userId');
    String jwt = await FlutterSecureStorage().read(key: 'jwt');
    print(jwt);
    var userData = await network.fetchData(jwt);
    return userData;
  }

//methose for log in user
  Future<dynamic> signInUser(String userEmail, String password) async {
    Network network = Network('$apiUrl/auth/login');
    var res = await network.postSignInUser(userEmail, password);
    print('here api market: $res');
    return res;
  }

//methode for register user
  Future<dynamic> registerUser(String userFirstName, String password,
      String userEmail, String userLastName) async {
    Network network = Network('$apiUrl/auth/register');
    var res = await network.postNewUser(
        userFirstName, password, userEmail, userLastName);
    print('here is the regiseter res :$res');
    return res;
  }
}
