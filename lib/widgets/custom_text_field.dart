import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.hintText, this.textInputType,this.onChanged,this.obscureText =false});
  String? hintText;
      
    TextInputType? textInputType;  
    bool?  obscureText;
  
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obscureText!,
         keyboardType: textInputType,
          onChanged: onChanged,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(10)
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(10)
              ),
              hintText: hintText,
              )),
    );
  }
}
