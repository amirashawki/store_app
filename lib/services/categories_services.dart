

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';
class CategoriesServices{
  Future<List<ProductModel>> getCategoryProducts({required String categoryName })async {
              http.Response response=await http.get(Uri.parse
              ('https://fakestoreapi.com/products/category/$categoryName'));

              if (response.statusCode==200) {
  List<dynamic >data= jsonDecode(response.body);
  List<ProductModel>productsList=[];
  for(int i=0;i<data.length;i++){
    productsList.add(ProductModel.fromJson(data[i]));
  
  }
  return productsList;
}
else{
  throw Exception('there is problem with status code with${response.statusCode}');
}
            }
}