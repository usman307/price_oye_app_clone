import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class cartmodel{

  late int cartid;
  late int cartprice;
  late String cartbrand;
  late int ? cartstock;
  late String ?cartimages;
  late String ?thumbnail;
cartmodel({required this.cartprice,required this.cartbrand,required this.cartid,this.cartstock,this.cartimages,required this.thumbnail});
}



