import 'package:flutter/material.dart';
import 'package:neostore_app/PAGES/loginPage.dart';
void main() {
  runApp(MyApp()
  
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),

      // Define the default brightness and colors.
      // brightness: Brightness.dark),
      //debugShowCheckedModeBanner: true,     
     // home:HomePage(),

    home: LoginDemo(),
    );
  }
}