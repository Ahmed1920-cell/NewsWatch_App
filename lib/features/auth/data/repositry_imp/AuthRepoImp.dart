import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:news/features/auth/data/DTO/Auth_model.dart';
import 'package:news/features/auth/data/data_source/AuthDataSource.dart';

import 'package:news/features/auth/domain/entity/Auth_Entity.dart';

import '../../domain/repositry/AuthRepo.dart';

class AuthRepoImp extends AuthRepo {
  BaseDataSource baseDataSource;
  AuthRepoImp({required this.baseDataSource});

  @override
  Future<Either<String, User?>> Signup(Auth Auth_user) async {
    try {
      AuthModel authModel = AuthModel.fromEntity(Auth_user);
      var user = await baseDataSource.Signup(authModel);
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> login(Auth Auth_user) async {
    try {
      AuthModel authModel = AuthModel.fromEntity(Auth_user);
      var user = await baseDataSource.login(authModel);
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> Google() async {
    try {
      var user = await baseDataSource.SignInGoogle();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> Reload() async {
    try {
      var user = await baseDataSource.Reload();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> Logout() async {
    try {
      var user = await baseDataSource.logout();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User?>> GetUser() async {
    try {
      var user = await baseDataSource.GetUser();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
