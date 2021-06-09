//@dart=2.9
import 'authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

void main() async{
  // List currencies = await getCurrencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final List _currencies;
  // MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Wallet',
      home: Authentication(),
    );
  }
}

// Future<List> getCurrencies() async {
//   try {
//     String cryptoUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=5000&convert=USD";
//     http.Response response = await http.get(cryptoUrl,
//     headers: {
//       'X-CMC_PRO_API_KEY': '8e834ab3-17f0-412e-b68d-e805b70cee52',
//       "Accept": "application/json",
//     });
//     return jsonDecode(response.body);
//   } catch (e) {
// print(e.toString());
// }
// }