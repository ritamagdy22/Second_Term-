import 'package:flutter/material.dart';

class StyleText extends StatelessWidget{

  String Texts;
  StyleText(this.Texts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      Texts,
      style: const TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black87,
         fontSize: 20
      ),

    );
  }
  
  
}