import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2/models/product_model.dart';
import 'package:project2/services/add_products.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  static String id = 'add product';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? productName;

  String? description;

  String? image;

  String? price, category;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Add Product')),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 70,
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
              CustomTextField(
                  hintText: 'Category',
                  onChanged: (data) {
                    category = data;
                  }),
              SizedBox(
                height: 5,
              ),
              customButton(
                  text: 'Add product',
                  onPressed: () async {
                    isloading=true;
                    setState(() {
                      
                    });
                    try {
                      await addProduct();
                      print('sucess');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isloading=false;
                    setState(() {
                      
                    });


                  }
                  
                  )
            ]))));
  }

  Future<ProductModel> addProduct() {
    return AddProducts().addProducts(
        price: price!,
        description: description!,
        title: productName!,
        image: image!,
        category: category!);
  }
}
