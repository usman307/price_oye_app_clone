import 'package:apiget/future.dart';
import 'package:apiget/loginoperations/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../component/button.dart';
import '../utils.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => siginin();
}

class siginin extends State<signin> {
  bool loading = false;
  final form = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            //    resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Personal information'),
              centerTitle: true,
            ),
            body:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Form(
                        key: form,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller:name,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10,left: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    hintText: 'Enter Name',


                                  ),

                                  validator: (value){

                                    if(value!.isEmpty){
                                      return 'Enter name';
                                    }
                                    else{
                                      return null;
                                    }
                                  },

                                ),

                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10),
                                    focusedBorder:OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                    border: OutlineInputBorder(

                                      borderRadius: BorderRadius.circular(10),

                                    ),

                                    hintText: 'Enter email',
                                    prefixIcon: Icon(Icons.email),


                                  ),
                                  validator: (value){
                                    email.text.toString();
                                    if(value!.isEmpty){
                                      return 'Enter email';
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    hintText: 'Enter Password',
                                    prefixIcon: Icon(Icons.password),


                                  ),
                                  validator: (value){
                                    password.text.toString();
                                    if (value!.isEmpty) {
                                      return 'Enter password';
                                    }
                                    else{
                                      return null;
                                    }
                                  },

                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          child: loginbutton(name: 'login',
                                              loading: loading,
                                              onTap: (){
                                                setState(() {
                                                  loading = true;
                                                });
                                                if(form.currentState!.validate()) {
                                                  auth.signInWithEmailAndPassword(
                                                      email: email.text.toString(),
                                                      password: password.text.toString())
                                                      .then((value) {

                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>future()),

                                                    );
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    utils().toastmessage(
                                                        value.user!.email.toString());
                                                  }).onError((error, stackTrace) {
                                                    setState(() {
                                                      loading=false;
                                                    });
                                                    utils().toastmessage(error.toString());
                                                  });
                                                }
                                              }),
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                                          },
                                          child: Text('Not have Account\n Sign Up?',style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 17),)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );

  }
}
