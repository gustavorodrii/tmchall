import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1FB98D), Color(0xFFFAFFBF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(Icons.verified_user, size: 56, color: Colors.white),
          SizedBox(height: 12),
          Text(
            'Bem-vindo!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Aqui você gerencia seus seguros e os da sua família!',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}