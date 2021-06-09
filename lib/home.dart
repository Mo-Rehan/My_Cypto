// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
//
// import 'dart:io';
//
// class HomeView extends StatefulWidget {
//
//
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   var currencies=[];
//   final List<MaterialColor> _colors = [Colors.yellow,Colors.blue,Colors.red,Colors.teal,Colors.orange];
//
//   // @override
//   // void initState() async {
//   //   super.initState();
//   //   currencies = await getCurrencies();
//   // }
//   // @override
//   // initState() {
//   //   updateValues();
//   // }
//   // updateValues() async {
//   //   var currencies = await getCurrencies();
//   //   setState(() {});
//   // }
//
//   Future<List> getCurrencies() async {
//
//       String cryptoUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
//       http.Response response = await http.get(cryptoUrl);
//       print(json.decode(response.body));
//       return json.decode(response.body);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("MY CRYPTO"),),
//       body: _cryptoWidget(),
//     );
//   }
//
//   Widget _cryptoWidget() {
//     return new Container(
//       child: new Column(
//         children: <Widget> [
//           new Flexible(
//             child: new ListView.builder(
//                 itemCount: currencies.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final Map currency = currencies[index];
//                   final MaterialColor color = _colors[index % _colors.length];
//                   return _getListItemUi(currency, color);
//                 }
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//     Widget _getListItemUi(Map currency, MaterialColor color) {
//       return new ListTile(
//         leading: new CircleAvatar(
//           backgroundColor: color,
//           child: new Text(currency['symbol']),
//         ),
//         title: Text(currency['name'],
//           style: TextStyle(
//               fontWeight: FontWeight.bold
//           ),
//         ),
//         subtitle: _getSubtitleText(
//             currency['current_price'], currency['last_updated']),
//         isThreeLine: true,
//       );
//
//     }
//
//
//     Widget _getSubtitleText(String priceINR, String percentageChange) {
//     TextSpan priceTextWidget = new TextSpan(text: "\$$priceINR\n",
//         style: TextStyle(color: Colors.black45));
//     String percentageChangeText = "1hr: $percentageChange%";
//     TextSpan percentageChangeTextWidget;
//     if (double.parse(percentageChange) > 0) {
//       percentageChangeTextWidget = new TextSpan(
//           text: percentageChangeText,
//           style: new TextStyle(color: Colors.green));
//     } else {
//       percentageChangeTextWidget = new TextSpan(
//           text: percentageChangeText,
//           style: new TextStyle(color: Colors.red));
//     }
//
//     return new RichText(
//         text: new TextSpan(
//             children: [priceTextWidget, percentageChangeTextWidget]));
//   }
//
// }
