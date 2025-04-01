import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onchange;
  final TextEditingController controller;
  final Color color;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    this.validator,
    this.onchange,
    this.color=BaseColorPalette.white
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        hintText: hintText,
        hintStyle:  TextStyle(fontSize: 18, color: color),
        filled: true,
        fillColor: Colors.transparent,
      ),
      style:  TextStyle(
        fontSize: 18,
        color: color,
      ),
      keyboardType: keyBoardType,
      obscureText: isObscure,
      validator: validator,
      onChanged: onchange,
      controller: controller,
      autofocus: false,
    );
  }
}