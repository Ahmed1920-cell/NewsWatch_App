import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/domain/entity/NewsEntity.dart';
import 'package:news/features/home/presention/widget/NewsItem.dart';

import '../../../../core/constants/image_paths.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/news_bloc.dart';
import 'CustomTextField.dart';


class NewsView extends StatefulWidget {
  NewsView({super.key, required this.data});
  List<NewsEntity> data;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late List<NewsEntity> NewsList;
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewsList = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FadeInRightBig(
            child: CustomTextFormField(
              onchange: (value) {
                if (value?.isEmpty ?? true)
                  NewsList = widget.data;
                else {
                  setState(() {
                    NewsList =
                        widget.data
                            .where(
                              (artical) => artical.title!
                                  .toLowerCase()
                                  .contains(value!.toLowerCase()),
                            )
                            .toList();
                  });
                }
              },
              hintText: 'Enter Title Search',
              controller: search,
              color: BaseColorPalette.gray,
            ),
          ),
          Expanded(
            child:
                NewsList.isNotEmpty
                    ? ListView.builder(
                      itemCount: NewsList.length,
                      itemBuilder:
                          (context, index) => FadeInLeftBig(
                            child: NewsItem(newsEntity: NewsList[index]),
                          ),
                    )
                    : Center(
                      child: TextWidget(
                        text: "No News",
                        size: 18,
                        color: BaseColorPalette.black,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
