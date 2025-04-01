import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:news/features/auth/domain/usecase/GetUser_usecase.dart';
import 'package:news/features/auth/domain/usecase/Google_usecase.dart';
import 'package:news/features/auth/domain/usecase/LogOut_UseCase.dart';
import 'package:news/features/auth/domain/usecase/Login_usecase.dart';
import 'package:news/features/auth/domain/usecase/Reload_UseCase.dart';
import 'package:news/features/auth/domain/usecase/Signup_usecase.dart';

import '../../domain/entity/Auth_Entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUsecase loginUsecase;
  SignupUseCase signupUseCase;
  GoogleUsecase googleUsecase;
  LogOutUseCase logOutUseCase;
  ReloadUseCase reloadUseCase;
  GetUserUseCase getUserUseCase;
  AuthBloc({required this.loginUsecase,
    required this.signupUseCase,
  required this.googleUsecase,
    required this.getUserUseCase,
    required this.reloadUseCase,
    required this.logOutUseCase
  })
    : super(AuthInitial()) {
    on<LoginEvent>(_Login);
    on<SignUpEvent>(_SignUp);
    on<GoogleEvent>(_Google);
    on<LogOutEvent>(_Logout);
    on<ReloadEvent>(_Reload);
    on<GetUserEvent>(_GetUser);
  }
  Future<void> _Login(LoginEvent event, Emitter<AuthState> emit) async {
    Auth auth = Auth(email: event.email, password: event.password);
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await loginUsecase.execute(auth);
    await result.fold((failure) async {
      EasyLoading.showError(failure);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) async {
      if(user !=null && !user.emailVerified){
        EasyLoading.showError("Check your Inbox");
        EasyLoading.dismiss();
        await user.sendEmailVerification();
        emit(AuthNotVerify());
      }
      else if(user !=null && user.emailVerified){

        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 1000));
        EasyLoading.dismiss();
        emit(AuthVerify());
      }
      else{
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        EasyLoading.showError("Error Try Again");
        EasyLoading.dismiss();
        emit(AuthError("Error Try Again"));
      }
    });
  }

  Future<void> _SignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    Auth auth = Auth(
      username: event.UserName,
      email: event.email,
      password: event.password,
      phone: event.Phone,
    );
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await signupUseCase.execute(auth);
    await result.fold((failure) async {

      EasyLoading.showError(failure);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) async {
      if(user !=null && !user.emailVerified){
        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 1000));
        EasyLoading.dismiss();
        await user.sendEmailVerification();
        emit(AuthNotVerify());
      }
      else if(user !=null && user.emailVerified){
        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 1000));
        EasyLoading.dismiss();
        emit(AuthVerify());
      }
      else{
        EasyLoading.dismiss();
        emit(AuthError("Error Try Again"));
      }
    });
  }

  Future<void> _Google(GoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await googleUsecase.execute();
     await result.fold((failure) async {
       EasyLoading.showError(failure);
       await Future.delayed(const Duration(milliseconds: 1000));
       EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) async {
      if(user !=null && !user.emailVerified){
        EasyLoading.dismiss();
        emit(AuthNotVerify());
      }
      else if(user !=null && user.emailVerified){

        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 1000));
        EasyLoading.dismiss();
        EasyLoading.dismiss();
        emit(AuthVerify());
      }
      else{
        EasyLoading.dismiss();
        emit(AuthError("Error Try Again"));
      }
    });
  }

  Future<void> _Logout(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await logOutUseCase.execute();
    await result.fold((failure) async {

      EasyLoading.showError(failure);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) async {

      EasyLoading.showSuccess('Success');
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();

      emit(AuthSignOut());
    });
  }

  Future<void> _Reload(ReloadEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await reloadUseCase.execute();
    await result.fold((failure) async {

      EasyLoading.showError(failure);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) async {
      if(user !=null && !user.emailVerified){

        EasyLoading.showError("Check your Inbox");
        EasyLoading.dismiss();
        await user.sendEmailVerification();
        emit(AuthNotVerify());
      }
      else if(user !=null && user.emailVerified){

        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 1000));
        EasyLoading.dismiss();
        emit(AuthVerify());
      }
    });
  }

  Future<void> _GetUser(GetUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    EasyLoading.show(status: 'loading...');
    final result = await getUserUseCase.execute();
    result.fold((failure) async {

      EasyLoading.showError(failure);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      emit(AuthError(failure));
    }, (user) {
      if(user !=null){
        EasyLoading.dismiss();
        emit(AuthVerify());
      }
      else {
        EasyLoading.dismiss();
        emit(AuthSignOut());
      }
    });
  }
}
