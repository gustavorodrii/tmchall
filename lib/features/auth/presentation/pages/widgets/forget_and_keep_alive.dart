import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';

class ForgetAndKeepAliveWidget extends StatelessWidget {
  const ForgetAndKeepAliveWidget({
    super.key,
    required this.remember,
  });

  final bool remember;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckbox(
                value: remember,
                onTap: () {
                  context.read<AuthBloc>().add(ToggleRememberMe());
                },
              ),
              const SizedBox(width: 8),
              const Text(
                "Lembrar Sempre",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          FittedBox(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Esqueceu a senha?",
                style: TextStyle(color: Colors.tealAccent, fontSize: 12),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: value ? Colors.tealAccent : Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
