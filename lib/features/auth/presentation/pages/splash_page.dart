import 'package:flutter/material.dart';
import 'package:tmchall/core/key/navigator_key.dart';
import '../../../../core/services/remember_me_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkCredentials();
  }

  Future<void> _checkCredentials() async {
    await Future.delayed(Duration(milliseconds: 500));
    final credentials = await RememberMeService.getSavedCredentials();
    if (credentials.isNotEmpty &&
        credentials['email'] != null &&
        credentials['password'] != null) {
      navigatorKey.currentState?.pushReplacementNamed('/home');
    } else {
      navigatorKey.currentState?.pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00C281), Color(0xFFFFE76A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.white,
              ),
            ),
            Text(
              'Tokio Marine',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
