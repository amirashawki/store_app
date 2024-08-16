import 'package:flutter/material.dart';
import 'package:project2/pages/Home_page.dart';
import 'package:project2/pages/add_page.dart';
import 'package:project2/pages/update_page.dart';
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);
  



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      routes: {
       
        HomePage.id:(context) =>HomePage(),
        
         AddProductPage.id:(context)=>AddProductPage(),
         UpdateProductPage.id:(context)=>UpdateProductPage()
      },
      initialRoute:HomePage.id ,



        

      
    );
}
}