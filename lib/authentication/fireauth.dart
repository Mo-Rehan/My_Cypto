//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:core';
Future<bool>signIn(String email, String password) async{

  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }
  catch(e){
    print(e);
    return false;
  }

}

Future<bool>register(String email, String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  }
  on FirebaseAuthException catch(e){

    if(e.code=='weak-password'){
      print('password provided is weak');
    } else if(e.code=='email-already-in-use'){
      print('The account already exists for that email.');
    }
    return false;
  }
  catch (e){
    print(e.toString());
    return false;
  }
}



Future<bool> addCoin(String id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    double value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value});
        return true;
      }
      else {
        double newAmount = snapshot.data()["Amount"] + value;
        transaction.update(documentReference, {'Amount': value + snapshot.data()["Amount"]});
        return true;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeCoin(String id) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Coins')
      .doc(id)
      .delete();
  return true;
}


// Future<bool> addCoin(String id, String amount){
//   double value = double.parse(amount);
//   String uid = FirebaseAuth.instance.currentUser.uid;
//   // DocumentReference documentReference = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Coins').doc(id);
//   CollectionReference collectionReference = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Coins');
//   collectionReference.doc(id).set({"Amount"  : value});
//
//
// }