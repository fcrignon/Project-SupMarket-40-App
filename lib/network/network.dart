import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Network {
  final String url;
  Map<String, String> header;

  Network(
    this.url,
    //this.header
  );

  Future getData() async {
    print('Calling uri: $url');
    Response response = await get(url);
    if (response.statusCode == 200) {
      print('starting loading data');
      return response.body;
    } else if (response.statusCode == 204) {
      print('no content: ${response.statusCode}');
      return null;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }

  Future fetchData(String jwt) async {
    print('Calling uri: $url');
    Response response = await get(url, headers: {'x-access-token': jwt});
    if (response.statusCode == 200) {
      print('starting loading data');
      print(response.body);
      return response.body;
    } else if (response.statusCode == 204) {
      print('no content: ${response.statusCode}');
      return null;
    } else {
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }

  Future postNewUser(String userFirstName, String password, String userEmail,
      String userLastName) async {
    print('Calling uri: $url');
    Map<String, String> data = {
      'firstname': userFirstName,
      'lastname': userLastName,
      'email': userEmail,
      'password': password
    };
    Response response = await post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 201) {
      print('User successfully created');
      return 201;
    } else if (response.statusCode == 409) {
      print('User already exists');
      return 409;
    } else {
      throw Exception('Failled to register the user ${response.statusCode}');
    }
  }

//TODO geré le jwt
  Future postSignInUser(String userEmail, String password) async {
    print('Calling uri: $url');
    Map<String, String> data = {'email': userEmail, 'password': password};
    print(data);
    Response response = await post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      print('Login successfull');
      return response.body;
    } else if (response.statusCode == 404) {
      print('User not founded');
      return response.statusCode;
    } else if (response.statusCode == 401) {
      print('Inccorect password');
      return response.statusCode;
    } else {
      throw Exception('Failled to login ${response.statusCode}');
    }
  }

  Future postCreateNewReceipt() async {
    print('Calling uri: $url');
    Response response = await post(url, headers: header);
    if (response.statusCode == 201) {
      print('New receipt created');
      return response.body;
    } else {
      throw Exception('Failled to create new receipt ${response.statusCode}');
    }
  }
}
