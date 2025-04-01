import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositry/AuthRepo.dart';

class GetUserUseCase{
  AuthRepo authRepo;
  GetUserUseCase({required this.authRepo});
  Future<Either<String,User?>> execute () async{
    return await authRepo.GetUser();
  }
}