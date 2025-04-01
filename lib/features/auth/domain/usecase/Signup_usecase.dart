import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../entity/Auth_Entity.dart';
import '../repositry/AuthRepo.dart';

class SignupUseCase {
  AuthRepo authRepo;
  SignupUseCase({required this.authRepo});
  Future<Either<String,User?>> execute (Auth Auth_user) async{
    return await authRepo.Signup(Auth_user);
  }
}