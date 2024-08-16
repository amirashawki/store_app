
import 'package:flutter/material.dart';
import 'package:project2/models/product_model.dart';
import 'package:project2/pages/update_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.product,
    super.key,
  });
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
    Navigator.of(context, rootNavigator: true)
                  .pushNamed(UpdateProductPage.id, arguments: product
               );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10))
            ]),
            height: 120,
            width: 180,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0,7),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$''${product.price}'.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            
            right: 20,
            bottom: 90
            ,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
         
        ],
      ),
    );
  }
}
