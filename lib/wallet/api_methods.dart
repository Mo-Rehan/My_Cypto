//@dart=2.9
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: missing_return
Future<double> getPrice(String id) async {
  // try {
    var url = Uri.parse("https://api.coingecko.com/api/v3/coins/" + id);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var value = json['market_data']['current_price']['inr'].toString();
    print(double.parse(value));
    return double.parse(value);
  // } catch (e) {
  //   print(e.toString());
  // }
}


