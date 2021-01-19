// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
    RegisterRequestModel({
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.gender,
        this.phoneNo,
    });

    String firstName;
    String lastName;
    String email;
    String password;
    String confirmPassword;
    String gender;
    int phoneNo;

    factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        gender: json["gender"],
        phoneNo: json["phone_no"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender,
        "phone_no": phoneNo,
    };
}
