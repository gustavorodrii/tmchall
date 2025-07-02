import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.adb_sharp, size: 32, color: Colors.white),
            Text.rich(
              TextSpan(
                text: 'tokio\n',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'resolve',
                    style: const TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Text(
          'Acesse através das redes sociais',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.g_translate, size: 32, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.facebook, size: 32, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.apple, size: 32, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
