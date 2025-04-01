import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/core/services/dio_service.dart';
import 'package:news/features/auth/presention/bloc/auth_bloc.dart';
import 'package:news/features/home/data/repo_imp/NewsRepImp.dart';
import 'package:news/features/home/domain/usecase/GetNews_usecase.dart';
import 'package:news/features/home/presention/bloc/news_bloc.dart';

import '../../features/auth/data/data_source/AuthDataSource.dart';
import '../../features/auth/data/repositry_imp/AuthRepoImp.dart';
import '../../features/auth/domain/repositry/AuthRepo.dart';
import '../../features/auth/domain/usecase/GetUser_usecase.dart';
import '../../features/auth/domain/usecase/Google_usecase.dart';
import '../../features/auth/domain/usecase/LogOut_UseCase.dart';
import '../../features/auth/domain/usecase/Login_usecase.dart';
import '../../features/auth/domain/usecase/Reload_UseCase.dart';
import '../../features/auth/domain/usecase/Signup_usecase.dart';
import '../../features/home/data/data_source/HomeDataSource.dart';
import '../../features/home/domain/repo/NewsRepo.dart';
import '../services/firebase_service.dart';

final sl = GetIt.instance;
void intl()  {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(
          () => FirebaseService(sl<FirebaseAuth>(), sl<GoogleSignIn>()));
  sl.registerLazySingleton(
          () => AuthDataSource( firebaseService: sl<FirebaseService>()));
  sl.registerLazySingleton<AuthRepo>(
          () => AuthRepoImp(baseDataSource: sl<AuthDataSource>()));
  sl.registerLazySingleton(
          () => GetUserUseCase( authRepo: sl<AuthRepo>()));
  sl.registerLazySingleton(
          () => GoogleUsecase( authRepo: sl<AuthRepo>()));
  sl.registerLazySingleton(
          () => LoginUsecase( authRepo: sl<AuthRepo>()));
  sl.registerLazySingleton(
          () => LogOutUseCase( authRepo: sl<AuthRepo>()));
  sl.registerLazySingleton(
          () => ReloadUseCase( authRepo: sl<AuthRepo>()));
  sl.registerLazySingleton(
          () => SignupUseCase( authRepo: sl<AuthRepo>()));
  sl.registerFactory(
          () => AuthBloc(loginUsecase: sl(), signupUseCase: sl(), googleUsecase: sl(), getUserUseCase: sl(), reloadUseCase: sl(), logOutUseCase: sl()));
//News Screen
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(
          () => DioService(dio: sl<Dio>(), apiKey: Constants.API_Key, url: Constants.URL));
  sl.registerLazySingleton(
          () => HomeDataSource(  dioService: sl<DioService>()));
  sl.registerLazySingleton<NewsRepo>(
          () => NewsRepoImp(baseDataSource: sl<HomeDataSource>()));
  sl.registerLazySingleton(
          () => GetNewsUseCase( newsRepo: sl<NewsRepo>()));
  sl.registerFactory(
          () => NewsBloc(getNewsUseCase: sl<GetNewsUseCase>()));




}
