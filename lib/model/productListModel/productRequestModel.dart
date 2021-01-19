// To parse this JSON data, do
//
//     final productRequestModel = productRequestModelFromJson(jsonString);

import 'dart:convert';

ProductRequestModel productRequestModelFromJson(String str) => ProductRequestModel.fromJson(json.decode(str));

String productRequestModelToJson(ProductRequestModel data) => json.encode(data.toJson());

class ProductRequestModel {
    ProductRequestModel({
        this.productCategoryId,
        this.limit,
        this.page,
    });

    int productCategoryId;
    int limit;
    int page;

    factory ProductRequestModel.fromJson(Map<String, dynamic> json) => ProductRequestModel(
        productCategoryId: json["product_category_id"],
        limit: json["limit"],
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "product_category_id": productCategoryId,
        "limit": limit,
        "page": page,
    };
}
