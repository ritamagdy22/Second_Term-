import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType Type;

  CustomTextFormField({
    super.key,
    required this.Type,
    required this.validator,
    required this.controller,
    required this.hintText,
    this.isPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          )),
      controller: controller,
      validator: validator,
      keyboardType: Type,
      obscureText: isPassword,
    );
  }
}
