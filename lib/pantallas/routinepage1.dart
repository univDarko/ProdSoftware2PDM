import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/routine.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String brawlInfo = "Brawl Stars es un videojuego multijugador "
"para móviles disponible en Android y iOS, desarrollado por Supercell y lanzado globalmente en 2018. "
"Con temáticas simples y mecánicas difíciles, "
"visuales con grandes detalles interesantes y diferentes funcionalidades. "
"Actualmente lleva 5 años de existencia en el mundo de los videojuegos móviles.";

// ignore: must_be_immutable
class RoutinePage1 extends StatelessWidget{
  RoutinePage1({super.key, required this.userdb});

  final Userdatabase userdb;

  String _getusername(){
    return userdb.currentusername!;
  }

  Routine routine1 = Routine("Rutina 1", "Practica tiro con Este personaje", "null");
  Routine routine2 = Routine("Rutina 2", "Practica evasión con Este personaje", "null");
  Routine routine3 = Routine("Rutina 3", "Practica lanza con Este personaje", "null");
  
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context_) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "brawl"
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(212, 164, 62, 1)
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Container(
                constraints: const BoxConstraints(
                  minWidth: 500
                ),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20,),
                        const SizedBox(
                          height: 30,
                          child: Text(
                            "Brawler Favorito: 8-Bit",
                            textScaler: TextScaler.linear(2),
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/brawlAssets/brawlerexample.png")
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(routine1.title),
                          subtitle: Text(routine1.descr),
                        ),
                        ListTile(
                          leading: const Icon(Icons.work),
                          title: Text(routine2.title),
                          subtitle: Text(routine2.descr),
                        ),
                        ListTile(
                          leading: const Icon(Icons.rowing),
                          title: Text(routine3.title),
                          subtitle: Text(routine3.descr),
                        ),
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add)
                          ],
                        ),
                        const SizedBox(height: 50,),
                        const Text(
                          brawlInfo,
                          textScaler: TextScaler.linear(1.5),
                          textAlign: TextAlign.justify,
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                        const SizedBox(height: 50,),
                        UnconstrainedBox(
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                                  elevation: 1,
                              ),
                              onPressed: () {Navigator.pop(context_);},
                              child: const Text(
                                'Salir', 
                                textScaler: TextScaler.linear(1.5),
                                style: TextStyle(color: Colors.black),
                                ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        )
      )
    );
  }
}