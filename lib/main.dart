import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmchall/core/key/navigator_key.dart';
import 'package:tmchall/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/inject/bloc_providers.dart';
import 'features/auth/presentation/pages/login_register_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/home/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.all,
      child: MaterialApp(
        title: 'TM CHALL',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (_) => SplashPage(),
          '/login': (_) => LoginRegisterPage(),
          '/home': (_) => HomePage(),
        },
      ),
    );
  }
}
