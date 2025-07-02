import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmchall/features/home/presentation/bloc/home_bloc.dart';
import 'package:tmchall/features/home/presentation/bloc/home_event.dart';
import 'package:tmchall/features/home/presentation/bloc/home_state.dart';

import 'bloc/home_page_bloc.dart';

class FakeUser extends Fake implements User {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  group('HomeBloc – LoadHomeData sem auth', () {
    blocTest<HomeBloc, HomeState>(
      'emite [HomeLoading, HomeError]',
      build: () => HomeBloc(),
      act: (bloc) => bloc.add(LoadHomeData()),
      wait: const Duration(milliseconds: 1100),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>(),
      ],
    );
  });

  group('HomeBloc - LoadHomeData com usuário mockado', () {
    late MockFirebaseAuth mockAuth;
    late MockUser mockUser;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockUser = MockUser();

      when(() => mockUser.displayName).thenReturn('Gustavo');
      when(() => mockUser.email).thenReturn('gus@test.com');
      when(() => mockAuth.currentUser).thenReturn(mockUser);
    });

    blocTest<HomePageBlocTest, HomeState>(
      'emite [HomeLoading, HomeLoaded] com nome “Gustavo”',
      build: () => HomePageBlocTest(
        auth: mockAuth,
      ),
      act: (bloc) => bloc.add(LoadHomeData()),
      wait: const Duration(milliseconds: 1100),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoaded>().having((s) => s.name, 'nome', 'Gustavo'),
      ],
    );
  });
}
