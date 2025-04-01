import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/features/auth/domain/entity/Auth_Entity.dart';
import 'package:news/features/auth/domain/repositry/AuthRepo.dart';

class LoginUsecase{
  AuthRepo authRepo;
  LoginUsecase({required this.authRepo});
   Future<Either<String,User?>> execute (Auth Auth_user) async{
     return await authRepo.login(Auth_user);
   }
}