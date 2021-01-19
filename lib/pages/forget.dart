import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.red,

      appBar: AppBar(
              backgroundColor: Colors.red,
        title: Text('forgot password'),),
      body: Form(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height:10),
              TextFormField(

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),),
                      border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                      labelText: 'Email',
                      prefixIcon:Icon(
                        Icons.mail,
                        color: Colors.white,
                      ), 
                     
                      // errorStyle: TextStyle(color: Colors.white),
                      // labelStyle: TextStyle(color: Colors.white),
                      // hintStyle: TextStyle(color: Colors.white),
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white),
                      // ),
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white),
                      // ),
                      // errorBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.white,
                child: Text('Send password',style: TextStyle(color: Colors.red)),
                onPressed: () {},
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
