import 'package:flutter/material.dart';
import 'package:list_basic/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //la estetica de la aplicacion esta fuera de login y homscreen
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
        scaffoldBackgroundColor: Color.fromARGB(255, 18, 1, 1),
        useMaterial3: true,
        cardTheme: CardThemeData(color: Colors.grey.shade900),
      ),
    );
  }
}