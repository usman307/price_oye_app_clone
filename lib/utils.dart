import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class utils {

  dynamic toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.red,
        fontSize: 19.0
    );
  }

}
