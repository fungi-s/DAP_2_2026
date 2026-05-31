import 'package:flutter_application_1/screens/home-screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyCustomForm(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => homeScreen(userName: state.extra as String),
  ),
]);