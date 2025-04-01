import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/image_paths.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/auth_bloc.dart';


class VerificationViewBody extends StatelessWidget {
   VerificationViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColorPalette.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthNotVerify) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: BaseColorPalette.mainColor
                ,content: TextWidget(text: 'the Email not verify Check your Inbox', size: 18,color: BaseColorPalette.white,)));

          } else if (state is AuthVerify) {
            Navigator.pushNamedAndRemoveUntil(context, PageRouteName.initial,(route)=>false);
          }
        },
  child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    ImagePaths.logo,
                  ),
                ),
                const TextWidget(
                  align: TextAlign.center,
                  text: "Verification Email",
                  size: 26,
                  fontWeight: FontWeight.bold,
                  color: BaseColorPalette.black,
                ),
                const TextWidget(
                  align: TextAlign.center,
                  text: "Check your inbox ",
                  size: 18,
                  color: BaseColorPalette.black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                CustomElevatedButton(
                  textColor: BaseColorPalette.white,
                  buttonColor: BaseColorPalette.mainColor,
                  onPressed: () async{
                    BlocProvider.of<AuthBloc>(context).add(
                      ReloadEvent()
                    );
                  },
                  text: "Continue",
                )
              ],
            ),
          ),
        ],
      ),
),
    );
  }
}
