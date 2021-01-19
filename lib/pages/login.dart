import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore_app/HomePage/HomePage.dart';
import 'package:neostore_app/model/loginModel/loginErrorModel.dart';
import 'package:neostore_app/model/loginModel/loginModel.dart';
import 'package:neostore_app/model/loginModel/loginRequestModel.dart';
import 'package:neostore_app/networkApi/network.dart';
import 'package:neostore_app/pages/signup.dart';

import 'forget.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

  class _LoginDemoState extends State<LoginDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


   var _formKey = GlobalKey<FormState>();

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    backgroundColor: Colors.red,
      
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Text(
                      'NeoSTORE',
                      style: TextStyle(
                         color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                email(),
                password(),
                SizedBox(
                  height: 20,
                ),
                loginButton(),
                forgetButton(),
                SizedBox(
                  height: 80,
                ),
               createNewAccountButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget email() {

  return  Padding(
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
     borderSide: BorderSide(width: 1,color: Colors.white),
   ),
   enabledBorder: OutlineInputBorder( //normal
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white),
   ),
   border: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,)
   ),
   errorBorder: OutlineInputBorder( //on click on textfield
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white)
   ),
   focusedErrorBorder: OutlineInputBorder( //on click error
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white)
   ),
  // hintText: "HintText",
   hintStyle: TextStyle(fontSize: 16,color: Colors.white) ,
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
Widget password() {
  return  Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                 decoration: InputDecoration(
   //filled: true,
   //fillColor: Color(0xFFF2F2F2),
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(4)),
     //borderSide: BorderSide(width: 1,color: Colors.red),
   ),
   disabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white),
   ),
   enabledBorder: OutlineInputBorder( //normal
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white),
   ),
   border: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,)
   ),
   errorBorder: OutlineInputBorder( //on click on textfield
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white)
   ),
   focusedErrorBorder: OutlineInputBorder( //on click error
     borderRadius: BorderRadius.all(Radius.circular(4)),
     borderSide: BorderSide(width: 1,color: Colors.white)
   ),
  // hintText: "HintText",
   hintStyle: TextStyle(fontSize: 16,color: Colors.white) ,
   errorStyle: TextStyle(
      color: Colors.yellowAccent,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
             
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress, 
                onFieldSubmitted: (value) {}, 
                //obscureText: true, 
                  validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a valid password!'; 
                  } 
                  return null; 
                }, 
                ),
              );
}
Widget loginButton(){
  return Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      LoginRequestModel loginRequestModel = LoginRequestModel(
                        email: emailController.text,
                        password: passwordController.text

                      );

                      try {
                        var response = await NeoStoreNetwork().getLoginResponse(loginRequestModel);
                        if(response.statusCode==200){
                          var loginResponse = LoginModel.fromJson(json.decode(response.data));
                          print(loginResponse.data.firstName);
                          Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
                          

                        }
                        
                      }on DioError catch (e) {
                        var errorResponse = LoginErrorModel.fromJson(json.decode(e.response.data));
                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(errorResponse.userMsg),));
                 
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
              );
  
}
Widget forgetButton(){
  return  FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ForgotPassword()));
                },
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
}

Widget createNewAccountButton(){
  return  FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: Text(
                  'New User? Create new account',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              );
}


}
