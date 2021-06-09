import 'fireauth.dart';
import 'package:my_crypto/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_crypto/home.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'coinList.dart';


class Authentication extends StatefulWidget {
  // final List currencies;
  // Authentication(this.currencies);
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // final List currencies;
  // _AuthenticationState(this.currencies);

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.teal
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.tealAccent),
                controller: _emailField,
                decoration: InputDecoration(
                  hintText: "something@email.com",
                  hintStyle: TextStyle(
                    color: Colors.tealAccent,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.tealAccent),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
//                  hintText: "password",
//                  hintStyle: TextStyle(
//                    color: Colors.teal,
//                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await register(_emailField.text, _passwordField.text);
                  if(shouldNavigate){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinList()));
                  }
                  else{
                    alert(context);
                  }

                },
                child: Text("Register"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await signIn(
                      _emailField.text, _passwordField.text);
                  if (shouldNavigate) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CoinList()));
                  }
                  else{
                    alert(context);
                  }
                },
                child:Text("LogIn"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void alert(BuildContext context){
  var alertDialog = AlertDialog(
    title: Text("Email or Password Error"),
    content: Text("Already registered try login, or check email and password."),
  );

  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );
}

// Future<List> getCurrencies() async {
//   String cryptoUrl="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=50&convert=INR";
//   http.Response response = await http.get(cryptoUrl, headers: {
//     'X-CMC_PRO_API_KEY': '8e834ab3-17f0-412e-b68d-e805b70cee52',
//     "Accept": "application/json",
//   });
//   return json.decode(response.body);
// }


