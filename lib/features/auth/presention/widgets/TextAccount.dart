import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';

class TextAccount extends StatelessWidget {
  final VoidCallback onpress;
  final String Textaccount;
  final String TextButton;
  TextAccount({required this.onpress,required this.Textaccount,required this.TextButton});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: Textaccount,
          size: 18,
          color: BaseColorPalette.gray,
        ),
        InkWell(
          onTap:onpress ,
          child:  TextWidget(
            text: TextButton,
            size: 18,
            color: BaseColorPalette.mainColor,
          ),
        ),
      ],
    );
  }
}