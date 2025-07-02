import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmchall/core/key/navigator_key.dart';
import 'package:tmchall/features/auth/data/repositories/auth_repository_impl.dart';
import '../../../../core/services/remember_me_service.dart';
import '../../data/datasources/firebase_auth_datasource.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import 'widgets/main_content_auth_page.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  AuthMode getCurrentMode(AuthState state) => state.mode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(AuthRepositoryImpl(
        datasource: FirebaseAuthDatasource(),
      )),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              final bloc = context.read<AuthBloc>();

              if (bloc.rememberMe) {
                await RememberMeService.saveCredentials(
                  bloc.emailController.text,
                  bloc.passwordController.text,
                );
              } else {
                await RememberMeService.clearCredentials();
              }

              navigatorKey.currentState?.pushReplacementNamed('/home');
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final mode = getCurrentMode(state);

            return LayoutBuilder(
              builder: (context, constraints) {
                final halfHeight = constraints.maxHeight / 2;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        children: [
                          Container(
                            height: halfHeight,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF00C281), Color(0xFFFFE76A)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Container(
                            height: halfHeight,
                            color: const Color(0xFF2D2D2D),
                          ),
                        ],
                      ),
                    ),
                    MainContentAuthPage(mode: mode),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
