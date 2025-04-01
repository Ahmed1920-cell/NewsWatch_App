import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositry/AuthRepo.dart';

class LogOutUseCase{
  AuthRepo authRepo;
  LogOutUseCase({required this.authRepo});
  Future<Either<String,User?>> execute () async{
    return await authRepo.Logout();
  }
}