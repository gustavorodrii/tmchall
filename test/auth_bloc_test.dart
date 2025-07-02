// test/auth_bloc_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmchall/features/auth/domain/repositories/auth_repository.dart';
import 'package:tmchall/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tmchall/features/auth/presentation/bloc/auth_event.dart';
import 'package:tmchall/features/auth/presentation/bloc/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockRepo;

  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });

  setUp(() {
    mockRepo = MockAuthRepository();
    authBloc = AuthBloc(mockRepo);
  });

  tearDown(() {
    authBloc.close();
  });

  group('LoginSubmitted', () {
    test('sucesso emite [AuthLoading, AuthSuccess]', () async {
      when(() => mockRepo.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async {});

      authBloc.add(LoginSubmitted('a@b.com', '123'));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthSuccess>(),
        ]),
      );
    });

    test('erro emite [AuthLoading, AuthFailure]', () async {
      when(() => mockRepo.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('falha'));

      authBloc.add(LoginSubmitted('x', 'y'));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthFailure>(),
        ]),
      );
    });

    test('sem dados (email ou senha vazios) emite AuthFailure síncrono', () {
      authBloc.add(LoginSubmitted('', ''));

      expect(authBloc.state, isA<AuthFailure>());
    });
  });

  group('RegisterSubmitted', () {
    test('sucesso emite [AuthLoading, AuthSuccess]', () async {
      when(() => mockRepo.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            displayName: any(named: 'displayName'),
          )).thenAnswer((_) async {});

      authBloc.add(RegisterSubmitted('User', 'u@e.com', 'pwd'));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthSuccess>(),
        ]),
      );
    });

    test('erro emite [AuthLoading, AuthFailure]', () async {
      when(() => mockRepo.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            displayName: any(named: 'displayName'),
          )).thenThrow(Exception('erro'));

      authBloc.add(RegisterSubmitted('User', 'u@e.com', 'pwd'));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthFailure>(),
        ]),
      );
    });

    test('sem dados (campos vazios) emite AuthFailure síncrono', () {
      authBloc.add(RegisterSubmitted('', '', ''));

      expect(authBloc.state, isA<AuthFailure>());
    });
  });
}
