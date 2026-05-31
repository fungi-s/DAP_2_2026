import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  static const String name = 'home';
  final String userName;
  homeScreen({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Te logeaste wohooo'),
      ),
      body: Center(
        child: Text('Bienvenido $userName'),
      ),
    );
  }
}