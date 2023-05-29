import 'dart:convert';

import 'package:apiget/future.dart';
import 'package:apiget/futureclass.dart';
import 'package:apiget/model/cartmodel.dart';
import 'package:apiget/model/model.dart';
import 'package:apiget/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'model/cartprovider.dart';

class ProductScreen extends StatefulWidget {

  late int? price;


  late String? brand;
  late String? description;
 late  int ?stock;
 late String?images;



   ProductScreen({this.stock,this.brand,this.price,this.description,this.images});


  @override

  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
@override



@override
  void initState() {
    final cart = Provider.of<cartprovider>(context,listen: false).getcartdata();

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final cart = Provider.of<cartprovider>(context,listen: false);
    final getclass = Provider.of<futureclass>(context,listen: false);



    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SafeArea(
        child: Column(
          children: [
         //   Text('${widget.description}'),
            Expanded(
              child: FutureBuilder(
                  future: Future.value((cart.getproductlist)),
                   builder: (context,snapshot){
                    try{
                      if(snapshot.hasData){
                        return ListView.builder(
                            itemCount:snapshot.data!.length,
                            itemBuilder: (context,index){

                              final cartt = snapshot.data![index];
                              print(cartt.cartprice.toString());

                              return Column(
                                children: [
                                  Card(
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height:100,
                                              child: Image.network(widget.images.toString()),
                                            ),
                                            // Text(cartt.cartprice.toString()),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  cart.increasequantity(cartt);
                                                });

                                              },
                                              child: Container(
                                                child: Icon(Icons.add),
                                              ),
                                            ),

                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4),
                                                  child: Text(cartt.cartid.toString()),
                                                )),

                                            Spacer(),
                                            Text('Estimated Delivery Time'),

                                          ],
                                        ),
                                        Positioned(
                                            top: 60,
                                            right:10,
                                            child: Text('23 june',style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Positioned(
                                          left: MediaQuery.of(context).size.height*0.19,
                                          top: 30,
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                cart.decreasequantity(cartt);
                                              });


                                            },
                                            child: Container(
                                              child: Icon(Icons.minimize_outlined),
                                            ),
                                          ),),


                                      ],
                                    ),

                                  ),


                                ],
                              );
                            }
                        );
                      }
                      else if(snapshot.hasError){
                        return Text('error');
                      }
                      else if(!snapshot.hasData){
                        return CircularProgressIndicator();
                      }
                      return Text('Data not found');
                    }catch(e){
                return utils().toastmessage('Error Occured $e');
                    }
                  }
                   ),
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.10,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
            child:
            Center(child: Text('Total Price:${cart.totalprice().toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),

            ),
          )
          ]

        ),
      )
    );
  }
}
