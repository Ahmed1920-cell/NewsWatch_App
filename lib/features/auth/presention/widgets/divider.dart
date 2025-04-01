import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_widget.dart';
import '../../../../core/themes/color_palette.dart';

class customDivider extends StatelessWidget {
  const customDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return             Row(
  children: [
    Expanded(
      child: Divider(
        color: BaseColorPalette.gray,
        thickness: 1,
  
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10), 
      child: TextWidget(text: 'or login with ', size: 12, color: BaseColorPalette.gray,),
    ),
    Expanded(
      child: Divider(
         color: BaseColorPalette.gray,
        thickness: 1,
       
      ),
    ),
  ],
);
  }
}