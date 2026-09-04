import 'package:flutter_abm_albums/screens/login.dart';
import 'package:flutter_abm_albums/screens/home.dart';
import 'package:flutter_abm_albums/screens/detail.dart';
import 'package:flutter_abm_albums/screens/registro.dart';
import 'package:flutter_abm_albums/screens/alta.dart';
import 'package:flutter_abm_albums/screens/modificacion.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyCustomForm(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/detail/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return AlbumDetail(albumId: id); 
    },
  ),
  GoRoute(
    path: '/registro',
    builder: (context, state) => const RegistroScreen(),
  ),
  GoRoute(
    path: '/add',
    builder: (context, state) => const AddAlbumScreen(),
  ),
  GoRoute(
    path: '/edit/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return EditAlbumScreen(albumId: id);
    },
  ),
]);