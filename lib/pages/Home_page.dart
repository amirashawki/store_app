import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project2/models/product_model.dart';
import 'package:project2/pages/add_page.dart';
import 'package:project2/services/get_all_products.dart';
import 'package:project2/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'Home page';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(child: Text('New Trend ')),
            actions: [
              IconButton(
                onPressed: () {
 
                 Navigator.pushNamed(context,AddProductPage.id);

                       
                },
                icon: Icon(FontAwesomeIcons.cartPlus),
              ),
            ], 
            
          ),
          
          
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsServices().getAllProducts(),

                builder: (context, Snapshot) {
              

                  if (Snapshot.hasData) {
                    
                     List<ProductModel> products = Snapshot.data! ;
                     
                    return GridView.builder(
                      itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return CustomCard(product: products[index],);
                        });
                  } else {
                    return  Center(child: CircularProgressIndicator());
                  }
                }),
          ));
   
  }
}
