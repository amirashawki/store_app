import 'package:project2/helper/api.dart';
import 'package:project2/models/product_model.dart';

class AddProducts{
           Future<ProductModel>addProducts
           ({ required String price
           ,required String description,

   required String title,
   required String image,
   required String category,
  
   })async  {
                    Map<String,dynamic> data=
                    await Api().post(url: 'https://fakestoreapi.com/products', body: 
                    {
                      'title':title,
                      'price':price,
                      'image':image,
                      'category':category,
                      'description':description
                    });
                    return ProductModel.fromJson(data);
           }
} 