import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/remember_me_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoadHomeData(
      LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = FirebaseAuth.instance.currentUser;
      final email = user?.email ?? '';
      final name = user?.displayName ?? '';

      final cards = [
        {
          'label': 'Automóvel',
          'icon': Icons.directions_car,
          'url':
              'https://www.tokiomarine.com.br/?utm_source=google&utm_medium=cpc&utm_campaign=...'
        },
        {'label': 'Residência', 'icon': Icons.home, 'url': null},
        {'label': 'Vida', 'icon': Icons.favorite, 'url': null},
        {'label': 'Acidentes', 'icon': Icons.warning, 'url': null},
        {'label': 'Moto', 'icon': Icons.motorcycle, 'url': null},
        {'label': 'Empresas', 'icon': Icons.business_outlined, 'url': null},
      ];

      final drawerItems = [
        'Home / Seguros',
        'Minhas Contratações',
        'Meus Sinistros',
        'Minha Família',
        'Meus Bens',
        'Pagamentos',
        'Coberturas',
        'Validar Boleto',
        'Telefones Importantes',
        'Configurações'
      ];

      emit(HomeLoaded(
          email: email, cards: cards, drawerItems: drawerItems, name: name));
    } catch (e) {
      emit(HomeError('Erro ao carregar dados: $e'));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<HomeState> emit) async {
    await FirebaseAuth.instance.signOut();
    await RememberMeService.clearCredentials();

    emit(HomeLoggedOut());
  }
}
