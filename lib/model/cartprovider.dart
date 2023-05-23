import 'dart:convert';

import 'package:apiget/model/model.dart';
import 'package:apiget/model/productmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Product.dart';
import 'cartmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cartprovider with ChangeNotifier{

final String id = DateTime.now().microsecondsSinceEpoch.toString();

  // List<CartItem> items = [];
  // double total = 0;
  //
//   final CollectionReference <Map<String, dynamic>> _cartCollection = FirebaseFirestore.instance.collection('carts');
//
//
//   Future<dynamic> addToCart(Products products) async {
//     // await _cartCollection.doc(id).set(products.toJson());
//
//    await  _cartCollection.add(products.toJson());
// // await _cartCollection.doc(id).set({
// //   'id':products.toJson(),
// //
// // });
//   }


Future<dynamic> addToCart(Products products)async{
 // await ref.doc(id).set({
 //   'id': products.toJson(),
 // });


   final firebase = await FirebaseFirestore.instance.collection('carts');
  firebase.doc().set({
    'cartimages':products.images??'hello',
    'cartbrand':products.brand,
    'cartid':products.id,
    'cartprice':products.price,
    'cartstock':products.stock??2,
    'thumbnail':products.thumbnail??'gg'
  }

  );


}
List<Products> _returnproducts=[];
List<Products> get getpro => _returnproducts;
Future<dynamic> getproduct() async{
  final firebase = await FirebaseFirestore.instance.collection('mobiles').get();
  _returnproducts = firebase.docs.map((e) => Products(
    id:e['id'],
    brand: e['brand'],
    images: e['images'],
    discountPercentage: e['discountPercentage'],
    thumbnail: e['thumbnail'],
    price: e['price'],
    stock: e['stock'],
    description: e['description'],
    title: e['title'],
    category: e['category'],
    rating: e['rating'],
  )).toList();
notifyListeners();
}

List<cartmodel> _myproduct =[];
List<cartmodel> get getproductlist =>_myproduct;

Future<dynamic> getcartdata() async {

  final fire = await FirebaseFirestore.instance.collection('carts').get();
  _myproduct = fire.docs.map((e) =>

      cartmodel(
        cartimages: e['cartimages'],
          cartprice: e['cartprice'],
          cartbrand: e['cartbrand'],
          cartid: e['cartid'],
       cartstock: e['cartstock'],
        thumbnail: e['thumbnail']

      ),
  ).toList();
notifyListeners();



}
int totalprice(){
int total = 0;
for(var i in _myproduct){
  total = total+(i.cartprice??0)*(i.cartstock??0);

notifyListeners();
}
return total;

}
void increasequantity(cartmodel cart){
  cart.cartid++;
  notifyListeners();
}
  void decreasequantity(cartmodel cart){
  if(cart.cartid>1){
    cart.cartid--;
  }

    notifyListeners();
  }
Future<void> delete() async {
  final firebase = await FirebaseFirestore.instance
      .collection('carts')
      .doc().delete().then((value) => print("Document deleted"))
      .catchError((error) => print("Failed to delete document: $error"));

}



}







//   Future<void> getcart() async{
//     final firebase = await FirebaseFirestore.instance.collection('carts');
//  firebase.get().then((QuerySnapshot querysnapshot){
//   querysnapshot.docs.map((e) => Products(
//     description: e['description'],
//     price: e['price'],
//     images: e['images'],
//     brand: e['brand'],
//     stock: e['stock'],
//     discountPercentage: e['discountPercentage'],
//     category: e['category'],
//     rating: e['rating'],
//     thumbnail: e['thumbnail']
//   )).toList();
// }
// );
// //notifyListeners();
//
//   }













