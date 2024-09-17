import 'package:flutter/material.dart';
import 'package:ilmnur_mobile/config/routes/router.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IlmNur',
      debugShowCheckedModeBanner: false,
      color: AppColors.backgroundColor,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF000000),
            background: AppColors.backgroundColor),
        // useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
