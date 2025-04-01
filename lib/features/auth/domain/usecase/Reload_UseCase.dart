import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositry/AuthRepo.dart';

class ReloadUseCase{
  AuthRepo authRepo;
  ReloadUseCase({required this.authRepo});
  Future<Either<String,User?>> execute () async{
    return await authRepo.Reload();
  }
}