//@dart=2.9
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:my_crypto/details.dart';
import 'package:my_crypto/company.dart';


class CoinList extends StatefulWidget {


  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  Future<List<Coin>> _getCoin() async {
    var url = Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    List<Coin> coins = [];
    for (var u in jsonData) {
      Coin coin = new Coin(
        u["id"].toString(),
        u["name"].toString(),
        u["image"].toString(),
        u["current_price"].toString(),
        u["market_cap_rank"].toString(),
        u["price_change_24h"].toString(),
        u["high_24h"].toString(),
        u["low_24h"].toString(),
        u["price_change_percentage_24h"].toString(),
        u["market_cap"].toString(),
        u["market_cap_change_24h"].toString(),
      );
      coins.add(coin);
    }
    print(coins.length);
    return coins;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: new AppBar(
          title: Center(
            child: Text(
              "MY CRYPTO",
              style: TextStyle(color: Colors.black87),
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Companies()),
                  );
                },
                child: Icon(
                  Icons.home_work_outlined,
                  color: Colors.black87, // add custom icons also
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         new MaterialPageRoute(builder: (context) => HomeView()),
            //       );
            //     },
            //     child: Icon(
            //       Icons.account_balance_wallet_outlined,
            //       color: Colors.black87, // add custom icons also
            //     ),
            //   ),
            // ),
          ]),


      body: new Container(
        child: FutureBuilder(
          future: _getCoin(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data[index].market_cap_rank == "1") {
                      String rank = snapshot.data[index].market_cap_rank;
                      String value = snapshot.data[index].current_price;
                      return Center(
                          child: _topcard(
                              snapshot.data[index].image,
                              snapshot.data[index].name,
                              "\nMARKET CAP RANK: " + rank,
                              "INR : " + value + "/-\n",
                              snapshot.data[index]));
                    }
                    return ListTile(
                      contentPadding: EdgeInsets.all(4),
                      minVerticalPadding: 8,
                      leading: CircleAvatar(
                        maxRadius: 50,
                        backgroundImage:
                            NetworkImage(snapshot.data[index].image),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text("INR " +
                          snapshot.data[index].current_price +
                          "/-\n"
                              "Market Cap Rank : " +
                          snapshot.data[index].market_cap_rank),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(snapshot.data[index])));
                      },
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Widget _topcard(
      String image, String name, String rank, String value, Coin coin) {
    return Card(
      shadowColor: Colors.yellow,
      elevation: 10,
      margin: EdgeInsets.all(30),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ink.image(
          //   image: NetworkImage(image),
          //   height: 200,
          //   fit: BoxFit.cover,
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailsPage(coin)));
          //     },
          //   ),
          // ),
          Text(
            name + "\n",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              child: Text(
                value + rank,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Ink.image(
            image: NetworkImage(image),
            height: 200,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DetailsPage(coin)));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Coin {
  final String id;
  final String name;
  final String image;
  final String current_price;
  final String market_cap_rank;
  final String price_change_24h;
  final String high_24h;
  final String low_24h;
  final String price_change_percentage_24h;
  final String market_cap;
  final String market_cap_change_24h;

  Coin(
      this.id,
      this.name,
      this.image,
      this.current_price,
      this.market_cap_rank,
      this.price_change_24h,
      this.high_24h,
      this.low_24h,
      this.price_change_percentage_24h,
      this.market_cap,
      this.market_cap_change_24h);
}
