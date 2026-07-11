import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:list_basic/entities/albums.dart';
import 'package:google_fonts/google_fonts.dart';
//flutter run -d chrome --web-experimental-hot-reload

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final albumList = albums;


    return  Scaffold(

      body: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (context, index){
          return   Card(
            child: ListTile(
              title: Text(albumList[index].titulo, style: GoogleFonts.specialElite( color: Colors.red.shade800, fontSize: 15,),),
              subtitle: Text('${albumList[index].artista} - ${albumList[index].year}', style: GoogleFonts.specialElite( color: Colors.red.shade800, fontSize: 12,),),
              leading: Image.network(
                albumList[index].tapaUrl,
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
              onTap: (){
                context.push('/detail', extra: albumList[index]);
              },        
            ),
          );
        }
    ));
  }
}