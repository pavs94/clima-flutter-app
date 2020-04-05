import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getWeather() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }
  }
}
