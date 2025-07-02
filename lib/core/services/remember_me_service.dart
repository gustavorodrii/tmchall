import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RememberMeService {
  static const _storage = FlutterSecureStorage();

  static final _keyRemember = dotenv.env['KEY_REMEMBER'] ?? 'remember_me';
  static final _keyEmail = dotenv.env['KEY_EMAIL'] ?? 'email';
  static final _keyPassword = dotenv.env['KEY_PASSWORD'] ?? 'password';

  static Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _keyRemember, value: 'true');
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }

  static Future<Map<String, String?>> getSavedCredentials() async {
    final remember = await _storage.read(key: _keyRemember);
    if (remember == 'true') {
      final email = await _storage.read(key: _keyEmail);
      final password = await _storage.read(key: _keyPassword);
      return {
        'email': email,
        'password': password,
      };
    }
    return {};
  }

  static Future<void> clearCredentials() async {
    await _storage.deleteAll();
  }
}
