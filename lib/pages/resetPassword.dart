

import 'package:flutter/material.dart';
import 'package:neostore_app/progress.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          email(),
          SizedBox(height:30),
          submit(),

        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Reset Password'),
      ),
    );
  }

  Widget submit(){
  return Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                                onPressed:() {
                   Navigator.push( context, MaterialPageRoute(builder: (context) => Progress()));
                },
                 
                  
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
              );
  
}

  Widget email() {
    return Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          //filled: true,
          //fillColor: Color(0xFFF2F2F2),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            //borderSide: BorderSide(width: 1,color: Colors.red),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            //normal
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: OutlineInputBorder(
              //on click on textfield
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              //on click error
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          // hintText: "HintText",
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          errorStyle: TextStyle(
            color: Colors.yellowAccent,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),

          labelText: 'Email',
          hintText: 'Enter email id ',

          prefixIcon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          labelStyle: new TextStyle(
            color: const Color(0xFFFFFFFF),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return 'Enter a valid email!';
          }
          return null;
        },
      ),
    );
  }
}
