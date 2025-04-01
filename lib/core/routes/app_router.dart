import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/routes/page_route_name.dart';
import 'package:news/features/auth/presention/screen/login.dart';
import 'package:news/features/auth/presention/screen/signUp.dart';

import '../../features/auth/presention/bloc/auth_bloc.dart';
import '../../features/auth/presention/screen/verification_view.dart';
import '../../features/home/presention/screen/home.dart';
import '../../features/home/presention/widget/NewsBody.dart';
import '../dl/Dependency_Injection.dart';


class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => sl<AuthBloc>()..add(GetUserEvent()),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignOut) {
                      Navigator.pushNamedAndRemoveUntil(context, PageRouteName.login, (route) => false);
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return FadeInUpBig(
                          child:Home());
                    },
                  ),
                ),
              ),
          settings: settings,
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          builder: (context) => FadeInUpBig(child: login()),
          settings: settings,
        );
      case PageRouteName.signup:
        return MaterialPageRoute(
          builder: (context) => FadeInUpBig(child:Signup()),
          settings: settings,
        );
      case PageRouteName.verify:
        return MaterialPageRoute(
          builder: (context) => FadeInUpBig(child:VerificationView()),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Placeholder(),
          settings: settings, // Keep settings to preserve arguments
        );
    }
  }
}
