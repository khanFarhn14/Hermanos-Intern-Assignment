import 'dart:convert';
import 'package:hermanos_assignment/auth/data_layer/model/products.dart';
import 'package:hermanos_assignment/auth/data_layer/model/user_login.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/api.dart';
import 'package:http/http.dart' as http;


class FetchResult{

  Future login(String userName, String password) async {
    final userCredentials = UserLogin(userName: userName, password: password);

    final response = await http.post(
      Uri.parse('$url/auth/login'),
      body: userCredentials.toJson()
    );

    if(response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }

  Future<ProductList> fetchProducts() async{
    final response = await http.get(Uri.parse('$url$productUrl'));

    if(response.statusCode == 200){
      // debugPrint("-------------------------------- Status Code Ok --------------------------------");
      return ProductList.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load ProductList');
    }
  }

  Future<ProductList> fetchProductsByCategory(String categoryName) async{
    final response = await http.get(Uri.parse('$url$productUrl/products/$categoryName'));

    if(response.statusCode == 200){
      // debugPrint("-------------------------------- Status Code Ok --------------------------------");
      return ProductList.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load ProductList');
    }
  }
}