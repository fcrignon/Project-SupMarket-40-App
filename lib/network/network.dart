import 'package:http/http.dart';

class Network {
  final String url;
  Map<String, String> header;
  dynamic body;

  Network(
    this.url,
  );

  Future getData() async {
    print('Calling uri: $url');
    Response response = await get(url);
    if (response.statusCode == 200) {
      print('starting loading data');
      var data = response.body;
      return data;
    } else if (response.statusCode == 204) {
      print(response.statusCode);
      return null;
    } else if (response.statusCode == 201) {
      print(response.statusCode);
      return null;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }

  Future postData(dynamic data) async {
    print('Calling uri: $url');
    Response response = await post(url, headers: header, body: body);
    if (response.statusCode == 201) {
      return getData();
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
//TODO make a case for 204 response (Request received but nothing found)
