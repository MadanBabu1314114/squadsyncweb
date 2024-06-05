import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:squadsyncweb/main.dart';

class CustomMaterialBanner {
  void show(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        webShowClose: true,
        webPosition: 'center',
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0);

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        Fluttertoast.cancel();
      },
    );
  }
}
