import 'package:flutter_producto_calculos/screens/home-screen.dart';
import 'package:flutter_producto_calculos/screens/login.dart';
import 'package:flutter_producto_calculos/screens/result-screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyCustomForm(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => homeScreen(),
  ),
  GoRoute(
    path: '/results',
    builder: (context, state) => resultScreen(data: state.extra as Map<String, dynamic>),//mapstring ynamic es para pasarle los datos de varios tipos
  ),
]);