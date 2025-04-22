import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'model/cart_model.dart';
import 'pages/intro_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/history_page.dart';
import 'pages/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bursa Diskon',
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/intro': (context) => const IntroPage(),
          '/register': (context) => const RegisterPage(),
          '/forgot-password': (context) => const ForgotPasswordPage(),
          '/login': (context) => const LoginPage(),
          '/history': (context) => const HistoryPage(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
