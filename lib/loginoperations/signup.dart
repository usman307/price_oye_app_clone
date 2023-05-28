

import 'package:apiget/loginoperations/siginin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);


  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formm = GlobalKey<FormState>();


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final digitRegExp = new RegExp(r'[0-9]');
  final uppercaseRegExp = new RegExp(r'[A-Z]');
  final lowercaseRegExp = new RegExp(r'[a-z]');

  bool loading = false;
  // FirebaseAuth auth = FirebaseAuth.instance;
  dynamic login(){
    return
      InkWell(
        onTap: (){
          loading=loading;
          if(formm.currentState!.validate()){
            setState(() {
              loading=true;
            });
            auth.createUserWithEmailAndPassword(email: email.text.toString(), password: password.text.toString()).then((value) {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
              utils().toastmessage('Sign up Succesfully');
            }).onError((error, stackTrace) {
              utils().toastmessage('error');
              setState(() {
                loading=false;
              });
            });

          }

        },
        child:   Container(

          height: 50,

          width: double.infinity,

          decoration: BoxDecoration(

            color: Colors.red,

          ),

          child: Center(

            child: Text('Signup'),

          ),

        ),
      );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text('Sign up Information'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Form(
                  key: formm,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10,left: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              hintText: 'Enter Name',



                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'enter please';
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
                            validator: ( var value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              else if(value.length<=6){
                                return 'enter 6 digit';
                              }
                              else if(!value.contains(uppercaseRegExp)){
                                return 'password should contain at least one uppercase letter';
                              }
                              else if(!value.contains(lowercaseRegExp)){
                                return 'password should contain at least one lowercase letter';
                              }
                              else if(!value.contains(digitRegExp)){
                                return 'password should contain at least one digit';
                              }
                              else {
                                return null  ; // validation passed
                              }
                            },




                          ),
                          SizedBox(height: 10,),
                          Container(

                            child: TextFormField(

                              //    maxLength: 10,
                              maxLines: 5,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 30,left: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),


                                hintText: 'Enter your Address',
                                //  prefixIcon: Icon(Icons.location_city),


                              ),
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Enter Address';
                                }
                                else{
                                  return null;
                                }
                              },

                            ),
                          ),
                          SizedBox(height: 10,),

                          login(),
                        ],
                      ),
                    ),
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
