import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2/models/product_model.dart';
import 'package:project2/services/update_products.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({
    super.key,
  });
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;
  String? description;
  String? image;
  dynamic? price;
  
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Update Product')),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              CustomTextField(
                  hintText: ' Product Name',
                  onChanged: (data) {
                    productName = data;
                  }),
              CustomTextField(
                hintText: 'Description',
                onChanged: (data) {
                  description = data;
                },
              ),
              CustomTextField(
                  hintText: 'Price',
                  textInputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  }),
              CustomTextField(
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  }),
              SizedBox(
                height: 5,
              ),
             customButton(text:'update',onPressed:() async {
                          isloading = true;
                          setState(() {});

                          try {
                            await updateProduct(product);
                            print('sucess');
                          } on Exception catch (e) {
                             print(e.toString());
                          }

                          isloading = false;
                          setState(() {});
                        },      )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductsServices().updateProducts(
        id: product.id,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.description : description!,
        title: productName == null ? product.title : productName!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
