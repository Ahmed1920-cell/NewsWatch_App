import 'package:news/features/auth/domain/entity/Auth_Entity.dart';

class AuthModel extends Auth{
AuthModel({
  super.username,
  super.email,
  super.password,
  super.phone
});
  factory AuthModel.fromEntity(Auth user){
    return AuthModel(
      username:user.username,
      email:user.email,
      password:user.password,
      phone:user.phone
    );
  }
}