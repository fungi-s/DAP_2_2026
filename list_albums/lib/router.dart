import 'package:list_basic/screens/login.dart';
import 'package:list_basic/screens/home.dart';
import 'package:list_basic/screens/detail.dart';
import 'package:list_basic/entities/albums.dart';
import 'package:go_router/go_router.dart';
//flutter run -d chrome --web-experimental-hot-reload

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
  path: '/detail',
  builder: (context, state) {
    final album = state.extra as Album;
    return AlbumDetail(album: album);
  },
),
]);