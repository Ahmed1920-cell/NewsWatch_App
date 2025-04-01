import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositry/AuthRepo.dart';

class GoogleUsecase{
  AuthRepo authRepo;
  GoogleUsecase({required this.authRepo});
  Future<Either<String,User?>> execute () async{
    return await authRepo.Google();
  }
}