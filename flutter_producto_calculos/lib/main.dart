import 'package:flutter/material.dart';
import 'package:flutter_producto_calculos/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //la estetica de la aplicacion esta fuera de login y homscreen
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: Colors.indigo[50],
        useMaterial3: true,
      ),
    );
  }
}