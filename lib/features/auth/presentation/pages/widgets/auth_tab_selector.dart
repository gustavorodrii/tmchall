import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';

class AuthTabSelector extends StatelessWidget {
  final AuthMode mode;
  const AuthTabSelector({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        GestureDetector(
          onTap: () => context.read<AuthBloc>().add(ToggleAuthMode()),
          child: Column(
            children: [
              Text(
                'Entrar',
                style: TextStyle(
                  color:
                      mode == AuthMode.login ? Colors.tealAccent : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  decoration:
                      mode == AuthMode.login ? TextDecoration.underline : null,
                  decorationColor: mode == AuthMode.login
                      ? Colors.tealAccent
                      : Colors.transparent,
                ),
              ),
              SizedBox(
                height: 2,
                child: Container(
                  color: mode == AuthMode.login
                      ? Colors.tealAccent
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.read<AuthBloc>().add(ToggleAuthMode()),
          child: Column(
            children: [
              Text(
                'Cadastrar',
                style: TextStyle(
                  color: mode == AuthMode.register
                      ? Colors.tealAccent
                      : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  decoration: mode == AuthMode.register
                      ? TextDecoration.underline
                      : null,
                  decorationColor: mode == AuthMode.register
                      ? Colors.tealAccent
                      : Colors.transparent,
                ),
              ),
              SizedBox(
                height: 2,
                child: Container(
                  color: mode == AuthMode.register
                      ? Colors.tealAccent
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
