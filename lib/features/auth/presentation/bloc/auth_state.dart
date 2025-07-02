enum AuthMode { login, register }

abstract class AuthState {
  final AuthMode mode;

  const AuthState({required this.mode});
}

class AuthInitial extends AuthState {
  final bool rememberMe;
  const AuthInitial({
    this.rememberMe = false,
    super.mode = AuthMode.login,
  });
}

class AuthLoading extends AuthState {
  const AuthLoading({required super.mode});
}

class AuthSuccess extends AuthState {
  const AuthSuccess({required super.mode});
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message, {required super.mode});
}
