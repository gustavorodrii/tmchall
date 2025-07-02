import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<void> login({
    required String email,
    required String password,
  }) {
    return datasource.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String displayName,
  }) {
    return datasource.registerWithEmailAndPassword(
        email, password, displayName);
  }
}
