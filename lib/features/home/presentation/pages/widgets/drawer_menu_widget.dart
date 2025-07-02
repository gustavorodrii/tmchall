import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmchall/core/key/navigator_key.dart';
import '../../../../../shared/utils/app_dialog_utils.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';

class DrawerHomeWidget extends StatelessWidget {
  final HomeLoaded state;
  const DrawerHomeWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(Icons.person, size: 32, color: Colors.teal),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Olá!',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        state.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Minha conta',
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down_sharp,
                              color: Colors.white, size: 24),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  ...state.drawerItems.map((item) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.settings,
                            color: Colors.tealAccent),
                        title: Text(
                          item,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        onTap: () => navigatorKey.currentState?.pop(),
                      )),
                  Divider(
                    color: Colors.white24,
                    height: 1,
                  ),
                  TextButton(
                      onPressed: () async {
                        final shouldLogout =
                            await AppDialogUtils.showLogoutConfirmation(
                                context);

                        if (shouldLogout) {
                          context.read<HomeBloc>().add(LogoutRequested());
                        }
                        navigatorKey.currentState?.pop();
                      },
                      child: const Text(
                        'Sair',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF00C281), Color(0xFFFFE76A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(Icons.chat, size: 32, color: Colors.teal),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Dúvidas?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Converse agora mesmo e tire suas dúvidas com nosso time!',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
