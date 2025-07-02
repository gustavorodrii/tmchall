abstract class AuthDatasource {
  Future<void> loginWithEmailAndPassword(String email, String password);
  Future<void> registerWithEmailAndPassword(
      String email, String password, String displayName);
}
