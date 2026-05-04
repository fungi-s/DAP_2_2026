import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/tile.jpg'),
          repeat: ImageRepeat.repeat,
          scale: 2.0,
        ),
      ),
      child: Center(
        child: Text(
          'Hola mundo!',
          style: GoogleFonts.jacquard24(fontSize: 80, color: Colors.yellow,),
        ),
      ),
    ),
  ),
);}
}