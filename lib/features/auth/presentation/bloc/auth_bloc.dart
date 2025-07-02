import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  bool rememberMe = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<ToggleAuthMode>((event, emit) {
      final currentMode =
          state is AuthInitial ? (state as AuthInitial).mode : AuthMode.login;
      emit(AuthInitial(
          mode: currentMode == AuthMode.login
              ? AuthMode.register
              : AuthMode.login));
    });

    on<ToggleRememberMe>((event, emit) {
      rememberMe = !rememberMe;
      emit(AuthInitial(
        mode:
            state is AuthInitial ? (state as AuthInitial).mode : AuthMode.login,
        rememberMe: rememberMe,
      ));
    });

    on<LoginSubmitted>((event, emit) async {
      final mode = state.mode;

      emit(AuthLoading(mode: mode));
      try {
        await repository.login(
          email: event.email,
          password: event.password,
        );

        emit(AuthSuccess(mode: mode));
      } catch (e) {
        emit(
            AuthFailure('Credenciais inválidas, tente novamente.', mode: mode));
      }
    });

    on<RegisterSubmitted>((event, emit) async {
      final mode = state.mode;

      emit(AuthLoading(mode: mode));
      try {
        await repository.register(
          email: event.email,
          password: event.password,
          displayName: event.name,
        );

        emit(AuthSuccess(mode: mode));
      } catch (e) {
        emit(AuthFailure('Encontramos um erro, tente novamente.', mode: mode));
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}
