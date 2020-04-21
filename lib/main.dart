import 'package:doctordirectory/src/pages/search_mainpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'assets/call_service.dart';
import 'assets/service_locator.dart';
import 'src/theme/theme.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Fluttertoast.showToast(
        msg: "Internet Required"
        "\nPlease Wait...",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
    );
    //to Register the calls and message service
   // setupLocator();
    return MaterialApp(
      theme: AppTheme.lightTheme,

      home: JSONDemo(),


      debugShowCheckedModeBanner: false,
    );
  }
}
