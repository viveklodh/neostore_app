

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore_app/networkApi/network.dart';
import 'package:neostore_app/pages/login.dart';

import '../model/registerModel/registerErrorModel.dart';
import '../model/registerModel/registerModel.dart';
import '../model/registerModel/registerRequestModel.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // ignore: non_constant_identifier_names
  TextEditingController first_nameController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController last_nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController confirm_passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController phone_noController = TextEditingController();


  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


   var formKey = GlobalKey<FormState>();


    bool value = false;
    int _groupValue = -1;

   String _gender = "Male";

  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _gender = "Male";
          break;
        case 1:
          _gender = "Female";
          break;
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(centerTitle: true,

        backgroundColor: Colors.red,
        title: Text('Register'),),
      backgroundColor: Colors.red,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
                      child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                firstName(),
             
                secondName(),
                 
                email(),
                
                password(),
             
                confirmPassword(),

               _genderRadio(_groupValue, _handleRadioValueChange),
             
                phoneNumber(),
             
               _checkBox(),

                registerButton(),
             
                _loginAccountLabel(),

        
                
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget firstName() {

  return  Padding(
               padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 8, bottom: 0),
                child: TextFormField(
                  controller: first_nameController,
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter first name!'; 
                  } 
                  return null; 
                }, 
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
                    labelText: 'First Name',
                    hintText: 'First Name',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              );
}
Widget secondName() {

  return  Padding(
                 padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: last_nameController,
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a last name!'; 
                  } 
                  return null; 
                }, 
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
                    labelText: 'last Name',
                    hintText: 'last Name ',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              );
}
Widget email() {

  return  Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                   padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: emailController,
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a valid email!'; 
                  } 
                  return null; 
                }, 
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
                    hintText: 'Enter valid email id ',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
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
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a valid password!'; 
                  } 
                  return null; 
                }, 
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
                ),
              );
}
Widget confirmPassword() {
  return  Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: confirm_passwordController,
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a valid password!'; 
                  } 
                  return null; 
                }, 
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
                    labelText: 'Confirm Password',
                    hintText: 'Confirm password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              );
}
Widget phoneNumber() {
  return  Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller:phone_noController,
                   validator: (value) { 
                  if (value.isEmpty) { 
                    return 'Enter a valid phone!'; 
                  } 
                  return null; 
                }, 
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
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    labelStyle: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              );
}
Widget registerButton(){
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
    child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                       onPressed: () async {
                    if(formKey.currentState.validate()){
                      RegisterRequestModel registerRequestModel = RegisterRequestModel(
                        firstName: first_nameController.text,
                        lastName: last_nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirm_passwordController.text,
                        gender: _groupValue.toString(),
                       phoneNo: int.parse(phone_noController.text),

                      );

                      try {
                        var response = await NeoStoreNetwork().getRegisterResponse(registerRequestModel);
                        if(response.statusCode==200){
                          var registerResponse = RegisterModel.fromJson(json.decode(response.data));
                          print(registerResponse.data.firstName);
                          Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginDemo()));
                          

                        }

                        
                      }on DioError catch (e) {
                        var errorResponse = RegisterErrorModel.fromJson(json.decode(e.response.data));
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(errorResponse.userMsg),));
                        //Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorResponse.userMsg),));
                      }
                    }
                  },
                    
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                ),
  );
  
}

Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        BuildContext context;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginDemo()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
            ),
              FlatButton(
                onPressed: () { 
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => LoginDemo()));
                 },
                child: Text(
                'Login',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

_genderRadio(int groupValue, handleRadioValueChanged){
  return 
    Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
        Text(
          'Gender',
          style: new TextStyle(color:Colors.white,fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Radio(
            activeColor: Colors.blue,
            value: 0,
            groupValue: groupValue,
            onChanged: handleRadioValueChanged),
        Text(
          "Male",
          style: new TextStyle(
             color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        Radio(
            activeColor: Colors.blue,
            value: 1,
            groupValue: groupValue,
            onChanged: handleRadioValueChanged),
        Text(
          "Female",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        )
      ]
      ),
    );
}
Widget _checkBox(){
  return Padding(
   padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),    
   child: Row( 
     // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[  
                  
                      Checkbox(  
                        checkColor: Colors.greenAccent,  
                        activeColor: Colors.red,  
                        value: this.value,  
                        onChanged: (bool newvalue) {  
                          setState(() {  
                            this.value = newvalue;  
                          });  
                        },  
                      ),  
                      Text('I agree the terms and condition',style: TextStyle(color:Colors.white,fontSize: 15.0), ),  
                      
                    ],
    ),
  );
}
  
}

