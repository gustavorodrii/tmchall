import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.mode,
  });

  final AuthMode mode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bloc = context.read<AuthBloc>();

        if (mode == AuthMode.login) {
          context.read<AuthBloc>().add(LoginSubmitted(
                bloc.emailController.text,
                bloc.passwordController.text,
              ));
        } else {
          context.read<AuthBloc>().add(RegisterSubmitted(
                bloc.emailController.text,
                bloc.passwordController.text,
                bloc.nameController.text,
              ));
        }
      },
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF00C281), Color(0xFFFFE76A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(
            Icons.arrow_forward,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
