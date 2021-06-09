
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  Future<List<CompaniesData>> _getCompany() async {
    var url = Uri.parse("http://www.json-generator.com/api/json/get/cbgGNZFkwO?indent=2");
    var response = await http.get(url);

    var jsonCompanyData = jsonDecode(response.body);
    List<CompaniesData> companies = [];
    for (var v in jsonCompanyData) {
      CompaniesData company = new CompaniesData(
        v["name"].toString(),
        v["country"].toString(),
        v["total_holdings"].toString(),
        v["total_entry_value_usd"].toString(),
        v["total_current_value_usd"].toString(),
        v["percentage_of_total_supply"].toString(),
      );
      companies.add(company);
    }
    print(companies.length);
    return companies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: new AppBar(
        title: Center(
          child: Text(
            "Companies Bitcoin Holdings",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.home_work_outlined,
              color: Colors.white, // add custom icons also
            ),
          ),
        ], // add custom icons also
      ),
      body: new Container(
        child: FutureBuilder(
          future: _getCompany(),
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
                    String logourl = "";

                    if (snapshot.data[index].name ==
                        "Galaxy Digital Holdings") {
                      logourl = "https://logo.clearbit.com/galaxydigital.com";
                    } else if (snapshot.data[index].name ==
                        "Marathon Patent Group") {
                      logourl = "https://logo.clearbit.com/songda5.com";
                    } else if (snapshot.data[index].name ==
                        "Hut 8 Mining Corp") {
                      logourl = "https://logo.clearbit.com/hut8mining.com";
                    } else if (snapshot.data[index].name == "NEXON Co Ltd") {
                      logourl = "https://logo.clearbit.com/nexon.com";
                    } else if (snapshot.data[index].name ==
                        "Voyager Digital LTD") {
                      logourl =
                          "https://logo.clearbit.com/voyagerdigital.com.au";
                    } else if (snapshot.data[index].name ==
                        "Riot Blockchain, Inc.") {
                      logourl = "https://logo.clearbit.com/riotblockchain.com";
                    } else if (snapshot.data[index].name ==
                        "Aker ASA (Seetee AS)") {
                      logourl = "https://logo.clearbit.com/akerasa.com";
                    } else if (snapshot.data[index].name ==
                        "Coin Citadel Inc") {
                      logourl = "https://logo.clearbit.com/coincitadel.net";
                    } else if (snapshot.data[index].name ==
                        "Cypherpunk Holdings Inc") {
                      logourl =
                          "https://logo.clearbit.com/cypherpunkholdings.com";
                    } else if (snapshot.data[index].name ==
                        "Advanced Bitcoin Technologies AG") {
                      logourl = "https://logo.clearbit.com/abt-ag.com";
                    } else if (snapshot.data[index].name ==
                        "Fortress Blockchain") {
                      logourl =
                          "https://logo.clearbit.com/fortresstechnologies.io";
                    } else if (snapshot.data[index].name ==
                        "The Brooker Group") {
                      logourl = "https://logo.clearbit.com/booker.com";
                    } else if (snapshot.data[index].name ==
                        "Mode Global Holdings") {
                      logourl = "https://logo.clearbit.com/modeglobale.fr";
                    } else if (snapshot.data[index].name ==
                        "Neptune Digital Assets Corp.") {
                      logourl =
                          "https://logo.clearbit.com/neptunedigitalassets.com";
                    } else if (snapshot.data[index].name == "FRMO Corp.") {
                      logourl = "https://logo.clearbit.com/frm.no";
                    } else {
                      String lowername =
                          snapshot.data[index].name.toLowerCase();
                      String nospace = lowername.replaceAll(" ", "");
                      String Noinc = nospace.replaceAll("inc.", "");
                      logourl = "https://logo.clearbit.com/" + Noinc + ".com";
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12,top: 10,bottom: 10),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 8, right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(8.0, 8.0),
                              ),
                            ]),
                        height: MediaQuery.of(context).size.height/1.6,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 13, bottom: 16),
                              child: CircleAvatar(
                                maxRadius: 60,
                                backgroundImage: NetworkImage(logourl),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 23.0),
                              child: Text(
                                snapshot.data[index].name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87),
                              ),
                            ),
                            Text( "Country : "+snapshot.data[index].country+"\n\n"
                                  "Total Holdings : "+snapshot.data[index].total_holdings+"\n\n"
                                  "Total Entry Value Usd : "+snapshot.data[index].total_entry_value_usd+"\n\n"
                                  "Total Current Value Usd : "+snapshot.data[index].total_current_value_usd+"\n\n"
                                  "Percentage of Total Supply : "+snapshot.data[index].percentage_of_total_supply+"%\n",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),

                            ),
                          ],
                        ),
                      ),
                    );

                    // return ListTile(
                    //   contentPadding: EdgeInsets.all(4),
                    //   minVerticalPadding: 8,
                    //   leading: CircleAvatar(
                    //     maxRadius: 50,
                    //     backgroundImage: NetworkImage(logourl),
                    //   ),
                    //   title: Text(snapshot.data[index].name),
                    //   subtitle: Text("Country " +
                    //       snapshot.data[index].country +
                    //       "\n"
                    //           "Total Holdings : " +
                    //       snapshot.data[index].total_holdings),
                    // );
                  });
            }
          },
        ),
      ),
    );
  }
}

class CompaniesData {
  final String name;
  final String country;
  final String total_holdings;
  final String total_entry_value_usd;
  final String total_current_value_usd;
  final String percentage_of_total_supply;

  CompaniesData(
      this.name,
      this.country,
      this.total_holdings,
      this.total_entry_value_usd,
      this.total_current_value_usd,
      this.percentage_of_total_supply);
}
