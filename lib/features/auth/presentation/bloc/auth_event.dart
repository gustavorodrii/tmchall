abstract class AuthEvent {}

class ToggleAuthMode extends AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
}

class RegisterSubmitted extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterSubmitted(this.email, this.password, this.name);
}

class ToggleRememberMe extends AuthEvent {}
