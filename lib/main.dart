import 'package:flutter/material.dart';
import 'package:neostore_app/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
      // Define the default brightness and colors.
      // brightness: Brightness.dark),
      //debugShowCheckedModeBanner: false,
     // home:HomePage(),
    home: LoginDemo(),
    );
  }
}