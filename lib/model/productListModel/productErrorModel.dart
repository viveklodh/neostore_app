// To parse this JSON data, do
//
//     final productErrorModel = productErrorModelFromJson(jsonString);

import 'dart:convert';

ProductErrorModel productErrorModelFromJson(String str) => ProductErrorModel.fromJson(json.decode(str));

String productErrorModelToJson(ProductErrorModel data) => json.encode(data.toJson());

class ProductErrorModel {
    ProductErrorModel({
        this.status,
        this.data,
        this.message,
        this.userMsg,
    });

    int status;
    bool data;
    String message;
    String userMsg;

    factory ProductErrorModel.fromJson(Map<String, dynamic> json) => ProductErrorModel(
        status: json["status"],
        data: json["data"],
        message: json["message"],
        userMsg: json["user_msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "message": message,
        "user_msg": userMsg,
    };
}
