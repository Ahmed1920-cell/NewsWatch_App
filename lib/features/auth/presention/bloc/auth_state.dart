part of 'auth_bloc.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthNotVerify extends AuthState {}
final class AuthVerify extends AuthState {}
final class AuthSignOut extends AuthState {}
final class AuthError extends AuthState {
  String error;
  AuthError(this.error);
}

