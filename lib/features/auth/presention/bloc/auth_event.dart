part of 'auth_bloc.dart';


sealed class AuthEvent {}
class LoginEvent extends AuthEvent{
  String email;
  String password;
  LoginEvent({required this.email,required this.password});
}
class SignUpEvent extends AuthEvent{
  String UserName;
  String email;
  String password;
  String Phone;
  SignUpEvent({required this.email,required this.password,required this.UserName,required this.Phone});
}
class GoogleEvent extends AuthEvent{

}
class ReloadEvent extends AuthEvent{

}
class LogOutEvent extends AuthEvent{

}
class GetUserEvent extends AuthEvent{

}

