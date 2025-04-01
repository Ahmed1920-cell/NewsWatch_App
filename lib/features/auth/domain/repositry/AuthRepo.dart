import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/features/auth/domain/entity/Auth_Entity.dart';

abstract class AuthRepo{
  Future<Either<String,User?>> login(Auth user);
  Future<Either<String,User?>> Signup(Auth user);
  Future<Either<String,User?>> Google();
  Future<Either<String,User?>> Reload();
  Future<Either<String,User?>> Logout();
  Future<Either<String,User?>> GetUser();
}