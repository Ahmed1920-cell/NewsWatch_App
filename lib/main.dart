import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news/features/home/presention/screen/home.dart';

import 'core/dl/Dependency_Injection.dart';
import 'core/routes/app_router.dart';
import 'core/routes/page_route_name.dart';
import 'core/services/cubit_observer.dart';
import 'core/themes/application_theme_manager.dart';
import 'features/auth/presention/screen/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  intl();
  Bloc.observer = AppCubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightThemeData,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: PageRouteName.initial,
      builder: EasyLoading.init(
      ),
    );
  }
}


