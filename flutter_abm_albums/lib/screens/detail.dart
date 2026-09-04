import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_abm_albums/providers/album_provider.dart';

class AlbumDetail extends ConsumerWidget {
  final String albumId;

  AlbumDetail({super.key, required this.albumId});

 @override
Widget build(BuildContext context, WidgetRef ref) {
  final album = ref.watch(albumByIdProvider(albumId))!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Image.network(//tapa del album
              album.tapaUrl,
              height: 300,
              width: 300,
            ),
            Text(//titulo del album
              album.titulo,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubikIso(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,),
            ),
            Text(//info adicional del album
              album.adicional,
              textAlign: TextAlign.center,
              style: GoogleFonts.specialElite(
                fontSize: 24,
                color: Colors.red.shade800,),
            ),
          ],
        ),
      ),
    );
  }
}