import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_cart/firebase_options.dart';
import 'package:food_cart/pages/login_page.dart';
import 'package:food_cart/pages/register_page.dart';
import 'package:food_cart/services/auth/auth_gate.dart';
import 'package:food_cart/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'services/auth/login_or_register.dart';
import 'models/restaurant.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      )
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
