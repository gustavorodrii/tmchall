import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmchall/core/services/remember_me_service.dart';
import 'package:tmchall/features/home/presentation/bloc/home_event.dart';
import 'package:tmchall/features/home/presentation/bloc/home_state.dart';

class HomePageBlocTest extends Bloc<HomeEvent, HomeState> {
  HomePageBlocTest({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance,
        super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final FirebaseAuth _auth;
  Future<void> _onLoadHomeData(
      LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final user = _auth.currentUser;
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
