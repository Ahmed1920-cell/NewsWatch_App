import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/auth/presention/bloc/auth_bloc.dart';
import 'package:news/features/home/presention/widget/NewsBody.dart';

import '../../../../core/dl/Dependency_Injection.dart';

import '../bloc/news_bloc.dart';


class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
        BlocProvider(
        create: (context) => sl<NewsBloc>()..add(GetNews())),
    BlocProvider(
    create: (context) => sl<AuthBloc>()),
    ],
      child: NewsBody(),
    );
  }
}
