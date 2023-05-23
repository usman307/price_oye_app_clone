import 'dart:convert';

import 'package:apiget/model/cartmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/model.dart';


class futureclass with ChangeNotifier{
  List<Model> _mylist =[];
  List<Model> get getlist => _mylist;
  var data;
  Future<Model> getproducts() async{
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
final id = DateTime.now().microsecondsSinceEpoch.toString();
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
     data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      await firestore.collection('mobiles').doc(id).set(data);


      return Model.fromJson(data);

    }

    else{
      return Model.fromJson(data);

    }

  }









}