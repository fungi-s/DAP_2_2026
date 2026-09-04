import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_abm_albums/providers/album_provider.dart';
//flutter run -d chrome --web-experimental-hot-reload

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final albumList = ref.watch(albumListProvider);


    return  Scaffold(

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: (){
                            context.push('/edit/${albumList[index].id}');
                          },
                          child: Text('editar', style: GoogleFonts.specialElite( color: Colors.red.shade800, fontSize: 15,),),
                        ),
                        TextButton(
                          onPressed: (){
                            eliminarAlbum(ref, albumList[index].id);
                          },
                          child: Text('X', style: GoogleFonts.specialElite( color: Colors.red.shade800, fontSize: 15,),),
                        ),
                      ],
                    ),
                    onTap: (){
                    context.push('/detail/${albumList[index].id}');
                  },       
                  ),
                );
              }
            ),
          ),
          ElevatedButton(
            onPressed: (){
              context.push('/add');
            },
            child: const Text('Agregar'),
          ),
        ],
      ));
  }
}