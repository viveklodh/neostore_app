// To parse this JSON data, do
//
//     final registerErrorModel = registerErrorModelFromJson(jsonString);

import 'dart:convert';

RegisterErrorModel registerErrorModelFromJson(String str) => RegisterErrorModel.fromJson(json.decode(str));

String registerErrorModelToJson(RegisterErrorModel data) => json.encode(data.toJson());

class RegisterErrorModel {
    RegisterErrorModel({
        this.status,
        this.data,
        this.message,
        this.userMsg,
    });

    int status;
    Data data;
    String message;
    String userMsg;

    factory RegisterErrorModel.fromJson(Map<String, dynamic> json) => RegisterErrorModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        userMsg: json["user_msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
        "user_msg": userMsg,
    };
}

class Data {
    Data({
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
    String phoneNo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
