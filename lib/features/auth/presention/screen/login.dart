import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/themes/color_palette.dart';
import 'package:news/core/widgets/text_widget.dart';
import 'package:news/features/auth/presention/bloc/auth_bloc.dart';
import 'package:news/features/auth/presention/widgets/Login_Body.dart';
import '../../../../core/constants/Validion.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';
import '../widgets/SignInGoogle.dart';
import '../widgets/TextAccount.dart';
import '../widgets/divider.dart';

class login extends StatelessWidget {
  login({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>sl<AuthBloc>(),
    child: LoginBody(),
    );
  }
}
