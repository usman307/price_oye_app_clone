
import 'package:flutter/material.dart';


class loginbutton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final bool loading;
  loginbutton({Key? key,required this .name,required this.onTap, this.loading=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,

          ),
          child: Center(
            child:loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.white,): Text(name,style: TextStyle(fontSize: 19),),
          )

      ),
    );
  }
}
