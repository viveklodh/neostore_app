import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:neostore_app/model/productListModel/ResponseProduct.dart';
import 'package:neostore_app/model/loginModel/loginRequestModel.dart';
import 'package:neostore_app/model/productsDetailsModel/DetailsModel.dart';
import 'package:neostore_app/model/registerModel/registerRequestModel.dart';

class NeoStoreNetwork {
  String url = 'http://staging.php-dev.in:8844/trainingapp/api';
  Dio dio = new Dio();

  Future<Response> getLoginResponse(LoginRequestModel loginRequestModel) async {
    FormData formdata = FormData.fromMap({
      'email': loginRequestModel.email,
      'password': loginRequestModel.password
    });
    Response response = await dio.post('$url/users/login', data: formdata);
    return response;
  }

  Future<Response> getRegisterResponse(
      RegisterRequestModel registerRequestModel) async {
    FormData formdata = FormData.fromMap({
      'first_name': registerRequestModel.firstName,
      'last_name': registerRequestModel.lastName,
      'email': registerRequestModel.email,
      'password': registerRequestModel.password,
      'confirm_password': registerRequestModel.confirmPassword,
      'gender': registerRequestModel.gender,
      'phone_no': registerRequestModel.phoneNo,
    });
    Response response = await dio.post('$url/users/register', data: formdata);

    return response;
  }

  Future<ResponseProduct> getProductResponse(String id) async {
  //  print("Api");
    try {
      Response response = await dio.get(url + "/products/getList",
          queryParameters: {"product_category_id": id});
  //    print(response.data.toString());
// print("Response: " + response.toString());
      var parsed = json.decode(response.data);
// print("Response: " + parsed['status'].toString());
return ResponseProduct.fromJson(parsed);
    } on DioError catch (e) {
      print("Message: " + e.message);
// print("Message: "+e.message);
      print("DioError: " + e.response.statusMessage);
      var parsed = json.decode(e.response.data);
      throw e.message;
    }

 
  }
  Future<DetailsModel> getProductDetails(String productid) async {
  //  print("Api");
    try {
      Response response = await dio.get(url + "/products/getDetail",
          queryParameters: {"product_id": productid});
  //    print(response.data.toString());
// print("Response: " + response.toString());
      var parsed = json.decode(response.data);
// print("Response: " + parsed['status'].toString());
return DetailsModel.fromJson(parsed);
    } on DioError catch (e) {
      print("Message: " + e.message);
// print("Message: "+e.message);
      print("DioError: " + e.response.statusMessage);
      var parsed = json.decode(e.response.data);
      throw e.message;
    }

 
  }
}
