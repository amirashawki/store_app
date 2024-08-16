import 'package:project2/helper/api.dart';
import 'package:project2/models/product_model.dart';

class UpdateProductsServices{
           Future<ProductModel>updateProducts
           ({ required String price
           ,required String description,
            required String title,
            required String image,
            required dynamic id,
            required String category})async  {
              print('product id = $id');
                    Map<String,dynamic> data=
                    await Api().put(url: 'https://fakestoreapi.com/products/$id', body: 
                    {
                      'title':title,
                      'price':price,
                      'image':image,
                      'category':category,
                      'description':description,
                      'id':id
                    });
                    return ProductModel.fromJson(data);
           }
} 