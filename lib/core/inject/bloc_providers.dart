import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/domain/repositories/auth_repository.dart';
import '../../../features/auth/data/datasources/firebase_auth_datasource.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';

class AppBlocProviders {
  static final AuthRepository authRepository = AuthRepositoryImpl(
    datasource: FirebaseAuthDatasource(),
  );

  static List<BlocProvider> all = [
    BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(
              authRepository,
            )),
  ];
}
