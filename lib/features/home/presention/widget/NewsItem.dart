import 'package:flutter/material.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/features/home/domain/entity/NewsEntity.dart';

import '../../../../core/constants/image_paths.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';

class NewsItem extends StatelessWidget {
   NewsItem({super.key,required this.newsEntity});
 NewsEntity newsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: (MediaQuery.sizeOf(context).height*8.0/776),horizontal: (MediaQuery.sizeOf(context).width*8.0/360)),
      decoration: BoxDecoration(
        border: Border.all(color: BaseColorPalette.border,width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              child: Image.network(newsEntity.ImageUrl??Constants.ImageNews,width: double.infinity,height: 300,fit: BoxFit.fill,)),
          SizedBox(height: 8), // Add space between image and text
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextWidget(text: newsEntity.title??"", size: 18,color: BaseColorPalette.black,fontWeight: FontWeight.bold,),
                  TextWidget(text: newsEntity.description??"", size: 16,color: BaseColorPalette.gray),
                ],
              ))
        ],
      ),
    );
  }
}
