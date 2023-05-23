import 'dart:convert';

import 'package:apiget/drawerheader.dart';
import 'package:apiget/futureclass.dart';
import 'package:apiget/models/iphone.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shimmer/shimmer.dart';

import 'model/cartprovider.dart';
import 'model/model.dart';

class future extends StatefulWidget {

  //  late int ? price;
  // late  int ? id;
  future({Key? key,}) : super(key: key);

  @override
  State<future> createState() => _futureState();
}

class _futureState extends State<future> {
  final video = 'https://www.youtube.com/watch?v=A6nCxzCv9JE';
  late YoutubePlayerController youtub;
  @override
  void initState() {
    final videoid = YoutubePlayer.convertUrlToId(video);


    youtub = YoutubePlayerController(
        initialVideoId: videoid!, flags: YoutubePlayerFlags(autoPlay: false));
    youtub.play();
    youtub.pause();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartprovider>(context,listen: false);

    final provider = Provider.of<futureclass>(context, listen: false);

    final orientation = MediaQuery.of(context).orientation;
    CarouselController caro = CarouselController();
    ScrollController scroll = ScrollController();

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              child: AppBar(
                  elevation: 2,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price Oye'),
                      SizedBox(
                        height: 30,
                        width: 230,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(Icons.mic),
                            label: Text('Search...'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          backgroundColor: Color(0xfff1f3f6),
          drawer: Drawer(
            width: 300,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    //    height: 400,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0, 30),
                          child: Text(
                            'PrIcE oYE.COM',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DrawerHeader(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: ListView(
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.verified_rounded,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        'Account',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        'Track my Order',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.app_registration,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        'Register Complaint',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.logout_rounded,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        'Logout',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      child: FutureBuilder(
                        future: provider.getproducts(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  Container(
                                    child: ExpansionTile(
                                      title: Text('Mobiles'),
                                      children: [
                                        Container(
                                          height: 100,
                                          child: ListView.builder(

                                               itemCount: snapshot
                                                   .data!.products!.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  leading: Text(

                                                    snapshot.data!
                                                        .products![index].brand
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                      leading: Icon(Icons.mobile_friendly),
                                    ),
                                  ),
                                  Container(
                                      child: ExpansionTile(
                                    title: Text('Tablets'),
                                    children: [
                                      Container(
                                        height: 100,
                                        child: ListView.builder(
                                            itemCount: snapshot.data!.products!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Text( snapshot.data!.products![index].brand.toString(),

                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                    leading: Icon(Icons.tablet_sharp),
                                  )),
                                  Container(
                                      child: ExpansionTile(
                                    title: Text('SmartWatches'),
                                    children: [
                                      Container(
                                        height: 100,
                                        child: ListView.builder(
                                            itemCount:
                                                 snapshot.data!.products!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Text(snapshot.data!.products![index].brand.toString(),

                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                    leading: Icon(Icons.watch),
                                  )),
                                  Container(
                                      child: ExpansionTile(
                                    title: Text('Wireless Buds'),
                                    children: [
                                      Container(
                                        height: 100,
                                        child: ListView.builder(
                                            itemCount:
                                                snapshot.data!.products!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                trailing: Text(
                                                  snapshot.data!
                                                      .products![index].brand
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                    leading: Icon(Icons.earbuds),
                                  )),
                                  Container(
                                      child: ExpansionTile(
                                    title: Text('Mobile Acessories'),
                                    children: [
                                      // Container(
                                      //   height: 100,
                                      //   child: ListView.builder(
                                      //       itemCount:
                                      //           snapshot.data!.products!.length,
                                      //       itemBuilder: (context, index) {
                                      //         return ListTile(
                                      //           leading: Text(
                                      //             snapshot.data!
                                      //                 .products![index].brand
                                      //                 .toString(),
                                      //             style:
                                      //                 TextStyle(fontSize: 19),
                                      //           ),
                                      //         );
                                      //       }),
                                      // ),
                                    ],
                                    leading: Icon(Icons.mobile_screen_share),
                                  )),
                                  Container(
                                      child: ExpansionTile(
                                    title: Text('Tv & Home Appliances'),
                                    children: [
                                      Container(
                                        height: 100,
                                        child: ListView.builder(
                                            itemCount:
                                                snapshot.data!.products!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Text(
                                                  snapshot.data!
                                                      .products![index].brand
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                    leading: Icon(Icons.electric_bolt_outlined),
                                  )),
                                ],
                              );
                            } else {
                              return Text('data');
                            }
                          })),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.products!.length,
                              itemBuilder: (context, index) {
                                //   print(snapshot.data!.products![index].images!.toString());
                                return Container(
                                  height: 300,
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 10),
                                  //   margin: EdgeInsets.all(3),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.white10,
                                        blurRadius: 20.0,
                                        spreadRadius: 3)
                                  ]
                                      //    borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //     color: Colors.red,
                                      ),
                                  child: Image.network(
                                    snapshot
                                        .data!.products![index]!.images!.first
                                        .toString(),
                                    fit: BoxFit.contain,
                                  ),
                                );
                              }),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Text('nothing');
                      }
                    }),
                FutureBuilder(
                    future: Future.value(provider.getproducts()),

                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return  Stack(
                          children: [
                            CarouselSlider.builder(

                                itemCount:snapshot.data!.products!.length ,
                                carouselController: caro,
                                itemBuilder: (context, index, realindex) {
                                  return Container(
                                    //   margin: EdgeInsets.only(left: 40),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          color: Colors.white10,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),

                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(

                                           snapshot.data!.products![index].images!.first.toString(),
                                          fit: BoxFit.contain,
                                        )
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  autoPlayAnimationDuration:
                                  Duration(milliseconds: 2000),
                                  //       autoPlay: true,
                                  //   enlargeCenterPage: true,
                                  viewportFraction: 1,
                                )),
                            Positioned(
                              bottom: 18,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  // borderRadius: BorderRadius.circular(2),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      caro.nextPage();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text('no data');
                      }
                    }),
                Container(
                  height: 50,
                  color: Color(0xfff1f3f6),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Mobiles',
                        ),
                        Text(
                          'ViewAll',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 200,
                          width: 400,
                          child: Stack(
                            children: [
                              GridView.builder(
                                  //   physics:ScrollPhysics(),
                                  controller: scroll,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.products!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    //    mainAxisExtent: 2,
                                    //    mainAxisSpacing: 2,
                                    crossAxisCount: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    final producttt = snapshot.data!.products![index];
                                    return Card(
                                      //   margin: EdgeInsets.only(left: 30),
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 7, top: 10),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: InkWell(
                                                onTap: (){
                                           //       cart.addToCart(producttt);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>iphone(id: snapshot.data!.products![index].id!.toInt(), price:  snapshot.data!.products![index].price!.toInt(),images:snapshot.data!.products![index].images!.first.toString() ,brand:snapshot.data!.products![index].brand.toString(),description: snapshot.data!.products![index].description.toString(),stock: snapshot.data!.products![index].stock!.toInt() ,)
                                                  ));
                                                },
                                                child: Container(
                                                  height: 100,

                                                  //    margin: EdgeInsets.only(right: 20),
                                                  child: Image.network(snapshot
                                                      .data!
                                                      .products![index]
                                                      .images!
                                                      .first
                                                      .toString()),
                                                ),
                                              ),
                                            ),
                                            Text(snapshot
                                                .data!.products![index].title
                                                .toString()),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Transform.translate(
                                                    offset: Offset(-60, 10),
                                                    child: Text('Rs:' +
                                                        snapshot
                                                            .data!
                                                            .products![index]
                                                            .price
                                                            .toString()))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                              Positioned(
                                  right: 1,
                                  child: Container(
                                    color: Color(0xf7e7d7f),
                                    child: IconButton(
                                      onPressed: () {
                                        scroll;
                                      },
                                      icon: Icon(Icons.arrow_forward_outlined),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Text('something went wrong ');
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shop By Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                        child: Text('Below 10,000' +
                                            snapshot.data!.products![2].price
                                                .toString())),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shops By Brand',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ViewAll',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.products!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      width: 60,
                                      //   height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.green,
                                      ),
                                      child: Center(
                                          child: Text(
                                        snapshot.data!.products![index]!.brand!
                                            .toString(),
                                        style: TextStyle(
                                            overflow: TextOverflow.fade),
                                      )),
                                    ),
                                  );
                                }),
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text('Something Went Wrong');
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text('Customer Reviews'),
                    Text('What our Customers say about Price oye.pk'),
                    FutureBuilder(
                        future: provider.getproducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 250,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.products!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(

                                            //    height:100,
                                            width: 400,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                            ),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                child: Icon(
                                                                  Icons
                                                                      .supervised_user_circle_rounded,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              'Mr Usman',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Verified Customer',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 80),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_rate_sharp,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 20,
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .star_rate_sharp,
                                                                color: Colors
                                                                    .yellow,
                                                                size: 20),
                                                            Icon(
                                                                Icons
                                                                    .star_rate_sharp,
                                                                color: Colors
                                                                    .yellow,
                                                                size: 20),
                                                            Icon(
                                                                Icons
                                                                    .star_rate_sharp,
                                                                color: Colors
                                                                    .yellow,
                                                                size: 20),
                                                          ],
                                                        )),
                                                    Transform.translate(
                                                        offset: Offset(80, 0),
                                                        child: Text(
                                                          '4March2024',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        child: Text(
                                                          'Satisfied with Product Thanks Price Oye',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                  ],
                                                ),
                                                Positioned(
                                                    left: 10,
                                                    top: 150,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .thumbnail
                                                                  .toString(),
                                                              width: 100,
                                                              height: 60,
                                                              fit: BoxFit.fill,
                                                            )))),
                                              ],
                                            )),
                                      );
                                    }),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Text('Data not found');
                          }
                        }),
                    Container(
                      decoration: BoxDecoration(color: Color(0xff1f3f6)),
                      child: Column(
                        children: [
                          Text(
                            'Best Seller',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text('Get the best Price in town'),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                              future: provider.getproducts(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 400,
                                            width: 330,
                                            decoration: BoxDecoration(
                                                //  color: Colors.red,
                                                ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data!.products![2].title
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      //   width: 200,

                                                      child: Image.network(
                                                          snapshot
                                                              .data!
                                                              .products![1]
                                                              .images!
                                                              .first
                                                              .toString())),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Rs' +
                                                          snapshot
                                                              .data!
                                                              .products![1]
                                                              .price
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          'Rs 200',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color:
                                                                  Colors.red),
                                                        )),
                                                    Transform.translate(
                                                        offset: Offset(10, 0),
                                                        child: Text(
                                                          '(8%off)',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Text('something went wrong');
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // flex:3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                      margin: EdgeInsets.only(left: 30),
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(snapshot
                                                .data!.products![3].brand
                                                .toString()),
                                            Container(
                                              height: 236,

                                              // height: 100,
                                              // width: 200,
                                              decoration: BoxDecoration(),
                                              child: Image.network(snapshot
                                                  .data!
                                                  .products![3]
                                                  .images!
                                                  .first
                                                  .toString()),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:52000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  //  flex:2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Card(
                                      margin: EdgeInsets.only(right: 30),
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(snapshot
                                                .data!.products![3].brand
                                                .toString()),
                                            Container(
                                              height: 219,
                                              //       margin: EdgeInsets.only(right:20),
                                              // height: 100,
                                              // width: 200,
                                              decoration: BoxDecoration(),
                                              child: Image.network(snapshot
                                                  .data!
                                                  .products![3]
                                                  .images!
                                                  .first
                                                  .toString()),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:300000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:40000(10%off)',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.red),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text('Something went wrong Please wait');
                      }
                    }),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // flex:3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                      margin: EdgeInsets.only(left: 30),
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(snapshot
                                                .data!.products![3].brand
                                                .toString()),
                                            Container(
                                              height: 236,

                                              // height: 100,
                                              // width: 200,
                                              decoration: BoxDecoration(),
                                              child: Image.network(snapshot
                                                  .data!
                                                  .products![3]
                                                  .images!
                                                  .first
                                                  .toString()),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:52000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  //  flex:2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Card(
                                      margin: EdgeInsets.only(right: 30),
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(snapshot
                                                .data!.products![3].brand
                                                .toString()),
                                            Container(
                                              height: 219,
                                              //       margin: EdgeInsets.only(right:20),
                                              // height: 100,
                                              // width: 200,
                                              decoration: BoxDecoration(),
                                              child: Image.network(snapshot
                                                  .data!
                                                  .products![3]
                                                  .images!
                                                  .first
                                                  .toString()),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:300000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Rs:40000(10%off)',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.red),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text('Something went wrong Please wait');
                      }
                    }),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Watches',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Viewall',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                FutureBuilder(
                    future: provider.getproducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 200,
                          width: 400,
                          child: Stack(
                            children: [
                              GridView.builder(
                                  //   physics:ScrollPhysics(),
                                  controller: scroll,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.products!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    //    mainAxisExtent: 2,
                                    //    mainAxisSpacing: 2,
                                    crossAxisCount: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      //   margin: EdgeInsets.only(left: 30),
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 7, top: 10),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Container(
                                                height: 100,

                                                //    margin: EdgeInsets.only(right: 20),
                                                child: Image.network(snapshot
                                                    .data!
                                                    .products![index]
                                                    .images!
                                                    .first
                                                    .toString()),
                                              ),
                                            ),
                                            Text(snapshot
                                                .data!.products![index].title
                                                .toString()),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Transform.translate(
                                                    offset: Offset(-60, 10),
                                                    child: Text('Rs:' +
                                                        snapshot
                                                            .data!
                                                            .products![index]
                                                            .price
                                                            .toString()))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                              Positioned(
                                  right: 1,
                                  child: Container(
                                    color: Color(0xf7e7d7f),
                                    child: IconButton(
                                      onPressed: () {
                                        scroll;
                                      },
                                      icon: Icon(Icons.arrow_forward_outlined),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Text('something went wrong ');
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        'images/price.jpg',
                        fit: BoxFit.contain,
                      )),
                ),
                Column(
                  children: [
                    Text(
                      'Loves and Recommended',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'Influencer talk about priceoye as a trusted brand',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(10),
                //           child: YoutubePlayer(
                //             width: 200,
                //             controller: youtub,
                //             showVideoProgressIndicator: false,
                //           ),
                //         ),
                //       ),
                //     ),
                //     // Expanded(
                //     //   child: Padding(
                //     //     padding: const EdgeInsets.all(8.0),
                //     //     child: ClipRRect(
                //     //       borderRadius: BorderRadius.circular(10),
                //     //       child: YoutubePlayer(
                //     //         thumbnail: Text('Price oye'),
                //     //         progressIndicatorColor: Colors.red,
                //     //         width: 200,
                //     //         controller: youtub,
                //     //         showVideoProgressIndicator: true,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Reason to Buy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),

                Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2c99ee),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2c99ee),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 50,
                          top: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'images/removeparcel.png',
                            ),
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 60,
                            child: Container(
                                child: Text(
                              'Open Parcel',
                              style: TextStyle(color: Colors.white),
                            ))),
                        Positioned(
                            top: 140,
                            left: 55,
                            child: Container(
                                child: Text(
                              '(ISB-LHR-KHI)',
                              style: TextStyle(color: Colors.white),
                            ))),
                        Positioned(
                          top: 170,
                          left: 43,
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xfffba338),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text('Know More')),
                          ),
                        ),
                        Positioned(
                          left: 260,
                          top: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'images/bankremove.png',
                            ),
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 290,
                            child: Container(
                                child: Center(
                                    child: Text(
                              'Easy',
                              style: TextStyle(color: Colors.white),
                            )))),
                        Positioned(
                            top: 140,
                            left: 273,
                            child: Container(
                                child: Center(
                                    child: Text(
                              'Installment',
                              style: TextStyle(color: Colors.white),
                            )))),
                        Positioned(
                          top: 170,
                          left: 247,
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xfffba338),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text('Know More')),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2c99ee),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2c99ee),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 50,
                          top: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'images/removerupee.png',
                            ),
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 60,
                            child: Container(
                                child: Text(
                              'Price Match',
                              style: TextStyle(color: Colors.white),
                            ))),
                        Positioned(
                            top: 140,
                            left: 80,
                            child: Container(
                                child: Text(
                              'Policy',
                              style: TextStyle(color: Colors.white),
                            ))),
                        Positioned(
                          top: 170,
                          left: 43,
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xfffba338),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text('Know More')),
                          ),
                        ),
                        Positioned(
                          left: 260,
                          top: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'images/packremove.png',
                            ),
                          ),
                        ),
                        Positioned(
                            top: 130,
                            left: 250,
                            child: Container(
                                child: Center(
                                    child: Text(
                              'Packagring Video',
                              style: TextStyle(color: Colors.white),
                            )))),
                        Positioned(
                          top: 170,
                          left: 247,
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xfffba338),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text('Know More')),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Tablets',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: provider.getproducts(),
                  builder: (context,snapshot){
                if(snapshot.hasData){
                  return Container(
                    height:200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context,index){
                      return  Stack(
                        children: [
                          Card(
                            margin: EdgeInsets.only(left: 20),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 90,left: 60,right: 60,top: 20),
                              child: Container(
                            //    height: 200,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(snapshot.data!.products![index].images!.first.toString()),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 140,
                            left: 60,
                            child: Container(
                              child: Column(
                                children: [
                                  Text(snapshot.data!.products![index].brand.toString()),
                                  SizedBox(height:5),
                                  Text('Starting From Rs:'+snapshot.data!.products![index].price.toString(),style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 180,
                            left: 50,
                            child: Container(
                              child: Row(
                                children: [
                                  Text('Rs.600',style: TextStyle(decoration: TextDecoration.lineThrough),),
                                  Transform.translate(
                                      offset: Offset(5,0),
                                      child: Text('(3% off)',))
                                ],
                              ),
                            ),
                          )
                        ],
                      );


                    }),
                  );
                }
                else if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);

                }
                else{
                  return Text('Error');
                }



              }),

SizedBox(height: 200,)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
