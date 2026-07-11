import 'package:flutter/material.dart';
import 'package:list_basic/entities/albums.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumDetail extends StatelessWidget {
  final Album album;

  AlbumDetail({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
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