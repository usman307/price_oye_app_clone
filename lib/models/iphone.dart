import 'package:apiget/cartscreen.dart';
import 'package:apiget/future.dart';
import 'package:apiget/model/cartmodel.dart';
import 'package:apiget/model/model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../futureclass.dart';
import '../model/cartprovider.dart';

class iphone extends StatefulWidget {
  late int? price;
  late int? id;
  late  String? images;
  late String? brand;
  late String? description;
 late  int ?stock;

  iphone(
      {Key? key,
      this.price,
      this.id,
      this.images,
      this.brand,
        this.stock,
      this.description})
      : super(key: key);

  @override

  State<iphone> createState() => _iphoneState();
}

class _iphoneState extends State<iphone> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? selectedindex;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  var _dropdownmwnu = 'dropdownmwnu';

  List<String> ind = [
    'Highlights',
    'Specification',
    'What in the Box',
    'Price Comparession'
  ];
@override

  void dispose() {
  _tabController?.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Products product = Products(id: widget.id,price: widget.price,brand: widget.brand,description: widget.description );

    final provider = Provider.of<futureclass>(context, listen: false);
    final Cartprovider = Provider.of<cartprovider>(context);

    Model model = Model();

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
                                            itemCount:
                                                snapshot.data!.products!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: CarouselSlider.builder(
                      itemCount: widget.images!.length,
                      itemBuilder: (context, index, ne) {
                        final prod = widget.images![index];

                        return Image.network('${widget.images}');
                      },
                      options: CarouselOptions(
                          //   autoPlay: true,
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.brand}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                        future: provider.getproducts(),
                        builder: (context,snapshot){

     return InkWell(
       onTap: (){

Cartprovider.addToCart(product);
Cartprovider.addToCart(product);
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: Colors.brown,
    content: Text('Item added to Cart',style: TextStyle(fontSize: 16),),
    duration: Duration(seconds: 3),
  ),

    );
Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(brand: widget.brand,images: widget.images,stock: widget.stock,)));


       },
       child: Container(
         margin: EdgeInsets.only(right: 5),
         width:140,
         decoration: BoxDecoration(
             color: Color(0xfffdeee0),
             border: Border.all(
               color: Colors.pink,
             ),
             borderRadius: BorderRadius.circular(5)
         ),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Align(

               alignment: Alignment.center,
               child: Text('Add to Cart')),
         ),
       ),
     );

                    }),
                    Container(
                      margin: EdgeInsets.only(
                     //   right: 200,
                      ),
                    //  height: 35,
             //   width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange),
                          color: Color(0xfffdeee0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/coin.png',
                              height: 20,
                            ),
                            Text('Earn 56000 coins'),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Text('5.0'),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text('1 Rating'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/approve.png',
                      height: 70,
                      width: 70,
                    ),
                    Text('PriceOye Assured'),
                    Image.asset(
                      'images/gift.png',
                      height: 50,
                    ),
                    Text(
                      '${widget.brand}free buds',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PriceOye Assured Price',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Availability',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs.${widget.price}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'In Stock',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Storage',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(right: 260),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '512GB-126GB RAM',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/cal.png',
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Installment Plans'),
                          ),
                        ],
                      ),
                      Transform.translate(
                          offset: Offset(-103, 0),
                          child: Text(
                            'Pakistan',
                            style: TextStyle(color: Colors.grey),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffeff0f1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/oye.png',
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Priceoye Gurantee '),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Get the item you order or get your money back',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(color: Color(0xffeff0f1)),
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 140),
                          //      height: 20,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'images/brand.png',
                            height: 60,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'images/pta.png',
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 70,
                    top: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            '1Year Warrenty',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Brand Warrenty',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 265,
                    top: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Pta Approved',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mobiles',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 140),
                          //      height: 20,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'images/alarm.png',
                            height: 60,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'images/delivery.png',
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 70,
                    top: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            '48hr Delivery',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Isb & Rawalpindi',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 265,
                    top: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Free Delivery',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'All Over Pakistan',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(color: Color(0xffeff0f1)),
              ),
              Container(
                  margin: EdgeInsets.only(left: 4, right: 4),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                  )),
                  height: 40,
                  child:  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.red,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      Text(
                        'Highlights',
                      ),
                      Text('Specification'),
                      Text('What in the box'),
                      Text('Price Comparession'),
                    ],
                  ),
                  ),
              Container(
                height: MediaQuery.of(context).size.height*1,
                child: TabBarView(

                    controller: _tabController, children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Column(
                      children: [

                        Container(
                            alignment: Alignment.center,
                            //   height: 30,
                            width: double.infinity,
                            color: Color(0xffeeeee4),
                            child: Text(
                              'Highlights',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Expanded(

                          child: Container(
                            child: Text('${widget.description}',style: TextStyle(fontSize: 17),),
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child: Container(
                            child: Image.asset('images/infinix.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text('${widget.description}',style: TextStyle(fontSize: 17),),
                          ),
                        ),
                    Expanded(
                      flex:2,
                      child: Container(
                        child: Image.asset('images/infinix.png'),
                      ),
                    ),

                        Expanded(
                          child: Container(
                            child: Text('${widget.description}',style: TextStyle(fontSize: 17),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          //   height: 30,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20),
                          color: Color(0xffeeeee4),
                          child: Text(
                            'Specifications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 4),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            children: [
                              Text(
                                'General Features',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  //elevation: 5,

                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                       //   mainAxisAlignment:
                                         //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Release Date',
                                            ),
                                            Text('2022-04-26'),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('SIM Support'),
                                            Text(
                                                'Dual Sim, Dual Standby (Nano-SIM)')
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                        //  mainAxisAlignment:
                                          //    MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Phone Dimensions'),
                                            Text('170.47 x 77.60 x 8.32mm'),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Phone Weight'),
                                            Text('194.9 g'),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Operating System'),
                                            Text(
                                                'Android 11 OS, Most probably \n At the end of 2022,\n  User will Get the Android 12 Update'),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height:40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Container(


                          width: double.infinity,
                          child: Card(
                            //elevation: 5,

                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Text('Display',style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Screen Size',
                                      ),
                                      Text('6.82 Inches'),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Resolution'),
                                      Text('720 x 1640 Pixels')
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Type'),
                                      Text('IPS LCD Capacitive Touchscreen,\n 16M Colors, Multitouch'),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Protectiont'),
                                      Text('N/A'),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Container(


                          width: double.infinity,
                          child: Card(
                            //elevation: 5,

                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Text('Display',style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Screen Size',
                                      ),
                                      Text('6.82 Inches'),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Resolution'),
                                      Text('720 x 1640 Pixels')
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Type'),
                                      Text('IPS LCD Capacitive Touchscreen,\n 16M Colors, Multitouch'),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Screen Protectiont'),
                                      Text('N/A'),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),


                  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 150,
                          child: Image.asset('images/infinix.png',),
                        ),
                        Text('${widget.brand}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [

                              Expanded(

                                child: Container(

                                  height: 100,
                                  child:Image.asset('images/adaptor.png',),
                                ),
                              ), Expanded(
                                child: Container(
                                  height: 100,
                                  child:Image.asset('images/backcover.png',),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child:Image.asset('images/ejector.png',),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(

                          children: [
                            Expanded(

                                child: Container(
                                  alignment: Alignment.center,

                                    child: Text('Adaptor'))),
                            Expanded(

                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Backcover'))),
                            Expanded(

                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Ejector Pin'))),
                          ],
                        )

                      ],
                    ),
                  ),
                  Container(
                    height: 40,

                    //  width: double.infinity,

                    //   color: Color(0xffeeeee4),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              //   height: 30,
                              width: double.infinity,
                              color: Color(0xffeeeee4),
                              child: Text(
                                'Price Comparession',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(5),

                          value: _dropdownmwnu,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          items: [
                            DropdownMenuItem(value: 'dropdownmwnu', child: Text('Mcb ') ),
                            DropdownMenuItem(value: 'dropd2', child: Text('Ubl')),
                            DropdownMenuItem(value: 'dropdow3', child: Text('Askari')),

                          ],
                          onChanged: (String ?value) {
setState(() {
  _dropdownmwnu = value!;
});
                          },
                        ),
                      ),
                          Text('*Only Credit Card holders are eligible for installment plan',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            color:  Color(0xffeeeee4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Emi',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                Text('Monthly Installment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))
                              ],
                            ),

                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('3 Month'),
                                Text('${widget.price}')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              color:  Color(0xffeeeee4),
                              child: Row (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Text('5 Month'),
                                  Text('${widget.price}')
                                ],
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('10 Month'),
                                Text('${widget.price}')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              color:  Color(0xffeeeee4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('12 Month'),
                                  Text('${widget.price}')
                                ],
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('15 Month'),
                                Text('${widget.price}')
                              ],
                            ),
                          ),
                          SizedBox(height:20),
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Text('1. One Time Processing Fees: Flat 3.2% of the transaction amount or PKR 1200 FED, whichever is higher will be charged by the bank as per their Schedule of Charges (SOC).')),
                            ),
                          ),
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('2. One Time Service Fee: 2.5% will be charged.')),
                              ),
                            ),
                          ),
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('3. Please ensure Name and CNIC are of the cardholder.')),
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                ]
                ),
              ),



            ],
          )),
        ),
      ),
    );
  }
}
