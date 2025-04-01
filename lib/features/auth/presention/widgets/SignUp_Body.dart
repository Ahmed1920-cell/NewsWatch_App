import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/Validion.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/auth_bloc.dart';
import 'SignInGoogle.dart';
import 'TextAccount.dart';
import 'divider.dart';
import 'gab.dart';

class SignupBody extends StatefulWidget {
   SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController Phone = TextEditingController();

  GlobalKey<FormState> form_key = GlobalKey();

  bool IsSecure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColorPalette.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthNotVerify) {
            Navigator.pushNamedAndRemoveUntil(context, PageRouteName.verify,(route)=>false);
          } else if (state is AuthVerify) {
            Navigator.pushNamedAndRemoveUntil(context, PageRouteName.initial,(route)=>false);
          }
          else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                backgroundColor: BaseColorPalette.mainColor
                ,content: TextWidget(text: state.error, size: 18,color: BaseColorPalette.white,)));

          }
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding:  EdgeInsets.symmetric(vertical: (MediaQuery.sizeOf(context).height*8.0/776),horizontal: (MediaQuery.sizeOf(context).width*8.0/360)),
          child: Form(
            key: form_key,
            child: ListView(
              children: [
                Image.asset(ImagePaths.logo, height: MediaQuery.sizeOf(context).height* 100/776, width: MediaQuery.sizeOf(context).width*200/360),
                Gab(),
                CustomTextFormFiled(
                  hintText: 'Enter the User Name',
                  controller: username,
                  validator: Valid.valid_name,
                  color: BaseColorPalette.gray,
                  prefixIcon: Icon(Icons.person),
                ),
                Gab(),
                CustomTextFormFiled(
                  hintText: 'Enter the Email',
                  controller: email,
                  validator: Valid.valid_email,
                  color: BaseColorPalette.gray,
                  prefixIcon: Icon(Icons.email),
                ),
                Gab(),
                CustomTextFormFiled(
                  hintText: 'Enter the Password',
                  controller: password,
                  validator: Valid.valid_password,
                  color: BaseColorPalette.gray,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      IsSecure=!IsSecure;
                    });
                  }, icon: IsSecure?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                  isObscure: IsSecure,
                ),
                Gab(),
                CustomTextFormFiled(
                  hintText: 'Enter the Phone',
                  controller: Phone,
                  validator: Valid.valid_phone,
                  color: BaseColorPalette.gray,
                  prefixIcon: Icon(Icons.phone),
                  keyBoardType: TextInputType.number,
                ),
                Gab(),
                CustomElevatedButton(
                  onPressed: () {
                    if (form_key.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignUpEvent(email: email.text, password: password.text, UserName: username.text, Phone: Phone.text),
                      );
                    }
                  },
                  text: 'Sign up',
                  textColor: BaseColorPalette.white,
                  buttonColor: BaseColorPalette.mainColor,
                ),
                Gab(),
                customDivider(),
                Gab(),
                SigninGoogle(),
                Gab(),
                TextAccount(
                  onpress: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  Textaccount: "Don't have An Account?  ",
                  TextButton: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
