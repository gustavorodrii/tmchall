import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/utils/rounded_input_text_field.dart';
import '../../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Column(
      children: [
        RoundedInputField(
          controller: bloc.emailController,
          hintText: 'E-mail',
        ),
        const SizedBox(height: 12),
        RoundedInputField(
          controller: bloc.passwordController,
          hintText: 'Senha',
        ),
      ],
    );
  }
}
