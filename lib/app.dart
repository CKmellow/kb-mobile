
import 'package:flutter/material.dart';
import 'features/splash/splash_view.dart';

class KBApp extends StatelessWidget {
  const KBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
