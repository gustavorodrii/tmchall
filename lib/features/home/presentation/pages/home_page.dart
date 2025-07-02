import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmchall/core/key/navigator_key.dart';

import '../../../../shared/utils/app_dialog_utils.dart';
import '../../../../shared/utils/placeholder_widget.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'widgets/drawer_menu_widget.dart';
import 'widgets/home_sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHomeData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeError) {
            return Scaffold(
              backgroundColor: const Color(0xFF1E1E1E),
              body: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          if (state is HomeLoggedOut) {
            Future.microtask(() {
              navigatorKey.currentState?.pushReplacementNamed('/login');
            });
            return const SizedBox.shrink();
          }

          if (state is HomeLoading) {
            return Scaffold(
              backgroundColor: const Color(0xFF1E1E1E),
              appBar: AppBar(
                backgroundColor: const Color(0xFF121212),
                title: const Text(
                  "TOKIO MARINE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              drawer: const Drawer(),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  PlaceholderHeader(),
                  SizedBox(height: 24),
                  PlaceholderCards(count: 4),
                  SizedBox(height: 24),
                  PlaceholderSection(),
                  SizedBox(height: 24),
                  PlaceholderSection(),
                ],
              ),
            );
          }

          if (state is HomeLoaded) {
            return WillPopScope(
              onWillPop: () async {
                final shouldLogout =
                    await AppDialogUtils.showLogoutConfirmation(context);

                if (shouldLogout) {
                  context.read<HomeBloc>().add(LogoutRequested());
                }
                return false;
              },
              child: Scaffold(
                backgroundColor: const Color(0xFF1E1E1E),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF121212),
                  title: const Text(
                    "TOKIO MARINE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: InkWell(
                        onTap: () {},
                        child: const Badge(
                          child: Icon(Icons.notifications, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                drawer: DrawerHomeWidget(state: state),
                body: ListView(
                  children: [
                    HeaderCard(userName: state.name),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 24,
                        children: [
                          QuoteSection(cards: state.cards),
                          const FamilySection(),
                          const ContractsSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
