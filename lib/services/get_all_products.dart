

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project2/models/product_model.dart';

class AllProductsServices{

         
            Future<List<ProductModel>> getAllProducts()async {
              http.Response response=await http.get(Uri.parse('https://fakestoreapi.com/products'))
              ;
             
                   if(response.statusCode==200){
              List<dynamic >data= jsonDecode(response.body);
              print(data);

              List<ProductModel>productsList=[];
              for(int i=0;i<data.length;i++){
                productsList.add(ProductModel.fromJson(data[i]));

              }
              print('poduct list ${productsList}');
              return productsList;
              
            }else{
  throw Exception('there is problem with status code with${response.statusCode}');
}
            




}}