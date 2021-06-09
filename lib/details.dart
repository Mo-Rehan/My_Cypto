import 'package:flutter/material.dart';
import 'authentication/coinList.dart';

class DetailsPage extends StatelessWidget {
  final Coin coin;

  DetailsPage(this.coin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
          child: Text(
            coin.name,
            style: TextStyle(color: Colors.black87),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                CoinList();
              },
              child: Icon(
                Icons.refresh_sharp,
                color: Colors.black87, // add custom icons also
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          coinCard(coin),
          //     Container(
          //     child: Card(
          //       shadowColor: Colors.black87,
          //       elevation: 10,
          //       margin: EdgeInsets.only(top: 30, left: 13, right: 13),
          //       clipBehavior: Clip.antiAlias,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(24),
          //       ),
          //       child: Stack(
          //         alignment: Alignment.center,
          //         children: [
          //           Ink.image(
          //             image: NetworkImage("https://s3.coinmarketcap.com/generated/sparklines/web/7d/usd/1.png"),
          //             height: 200,
          //             fit: BoxFit.cover,
          //           ),
          //         ],
          //       ),
          //     ),
          // ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 12, right: 10, left: 16),
            child: Text(
              coin.name + " Price Statistics :",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
            ),
          ),

          tile("Market Cap Rank", "#" + coin.market_cap_rank),
          tile("Name", coin.name),
          tile("Current Price", "₹ " + coin.current_price),
          tile("Price change 24h", "₹ " + coin.price_change_24h),
          tile("Price change % 24h", "₹ " + coin.price_change_percentage_24h),
          tile("low_24h", "₹ " + coin.low_24h),
          tile("high_24h", "₹ " + coin.high_24h),
          tile("market_cap", "₹ " + coin.market_cap),
        ],
      ),
    );
  }

  Widget tile(String key, String value) {
    return Container(
      height: 57,
      margin: EdgeInsets.only(bottom: 13, right: 8, left: 8),
      padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(8.0, 8.0),
            )
          ]),
      child: Row(
        children: [
          Text(
            key + " :  " + value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget coinCard(Coin coin) {
    return Card(
      shadowColor: Colors.black87,
      elevation: 10,
      margin: EdgeInsets.only(top: 30, left: 13, right: 13),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            coin.name + "\n",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              child: Text(
                "Current Price: INR " +
                    coin.current_price +
                    " /-\n" +
                    "Market Rank: " +
                    coin.market_cap_rank,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Ink.image(
            image: NetworkImage(coin.image),
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
