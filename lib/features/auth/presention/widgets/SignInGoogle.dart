import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/firebase_service.dart';

import '../../../../core/constants/icon_paths.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/auth_bloc.dart';

class SigninGoogle extends StatelessWidget {
  const SigninGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        BlocProvider.of<AuthBloc>(context).add(
          GoogleEvent(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: BaseColorPalette.border,),
            borderRadius: BorderRadius.circular(18)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconPaths.google,height: 30,width: 30,),
            TextWidget(text: "Sign In Using Google", size: 18,color: BaseColorPalette.gray,)
          ],
        ),
      ),
    );
  }
}
