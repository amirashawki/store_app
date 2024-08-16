

import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
   customButton({required this.text,
    super.key, required  this.onPressed,
  });
  String text;
     VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15)),
          child: TextButton(
              onPressed:onPressed,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ))),
    );
  }
}