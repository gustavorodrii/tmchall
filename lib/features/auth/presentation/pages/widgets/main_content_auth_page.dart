import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';
import 'auth_submit_button.dart';
import 'auth_tab_selector.dart';
import 'forget_and_keep_alive.dart';
import 'login_form.dart';
import 'register_form.dart';
import 'social_buttons.dart';

class MainContentAuthPage extends StatelessWidget {
  const MainContentAuthPage({
    super.key,
    required this.mode,
  });

  final AuthMode mode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            spacing: 34,
            children: [
              const Text(
                'Bem vindo!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Aqui você gerencia seus seguros e de seus familiares em poucos cliques!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bloc = context.read<AuthBloc>();
                  final remember =
                      state is AuthInitial ? state.rememberMe : bloc.rememberMe;
                  final isLoading = state is AuthLoading;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D2D2D),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          spacing: 16,
                          children: [
                            AuthTabSelector(mode: mode),
                            if (mode == AuthMode.login)
                              const LoginForm()
                            else
                              const RegisterForm(),
                            ForgetAndKeepAliveWidget(remember: remember),
                            const SizedBox(height: 1),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        left: 0,
                        right: 0,
                        child: isLoading
                            ? const Center(
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.tealAccent),
                                    strokeWidth: 3,
                                  ),
                                ),
                              )
                            : AuthSubmitButton(mode: mode),
                      ),
                    ],
                  );
                },
              ),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
