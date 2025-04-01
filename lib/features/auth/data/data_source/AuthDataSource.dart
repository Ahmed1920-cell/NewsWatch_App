import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/core/services/firebase_service.dart';
import 'package:news/features/auth/data/DTO/Auth_model.dart';
import '../../domain/entity/Auth_Entity.dart';

abstract class BaseDataSource{
  Future<User?> login(AuthModel user);
  Future<User?> Signup(AuthModel user);
  Future<User?> SignInGoogle();
  Future<User?> Reload();
  Future<User?> logout();
  Future<User?> GetUser();
}

class AuthDataSource extends BaseDataSource{
  FirebaseService firebaseService;
  AuthDataSource({required this.firebaseService});
  @override
  Future<User?> Signup(AuthModel user) async{
    print(user);
    return await firebaseService.register(user.username!, user.email!, user.password!, user.phone!);
  }

  @override
  Future<User?> login(AuthModel user) async{
    return await firebaseService.login(email: user.email!, password: user.password!);
  }

  @override
  Future<User?> SignInGoogle() async{
    return await firebaseService.signInWithGoogle();
  }

  @override
  Future<User?> Reload() async {
    return await firebaseService.Reload();
  }

  @override
  Future<User?> logout() async{
    return await firebaseService.sign_out();
  }

  @override
  Future<User?> GetUser() async {
    return await firebaseService.getUser();
  }

}