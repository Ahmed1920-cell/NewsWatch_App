import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/auth/domain/repositry/AuthRepo.dart';
import 'package:news/features/auth/presention/bloc/auth_bloc.dart';

import '../../../../core/dl/Dependency_Injection.dart';
import '../widgets/verification_view_body.dart';


class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: VerificationViewBody(),
    );
  }
}
