import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/routine.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String clashclansinfo = "Clash of Clans "
"es un videojuego de estrategia y de construcción de aldeas en línea, para dispositivos móviles con "
"plataformas de iOS y Android. Fue desarrollado por Supercell y lanzado para dispositivos iOS el 2 de agosto del 2012, "
"y el 8 de octubre para dispositivos Android. En este mismo juego se basó "
"Clash Royale.";

// ignore: must_be_immutable
class RoutinePage2 extends StatelessWidget{
  RoutinePage2({super.key, required this.userdb});

  final Userdatabase userdb;

  String _getusername(){
    return userdb.currentusername!;
  }

  Routine routine1 = Routine("Rutina 1", "Practica estrategias con Reina Arquera", "null");
  Routine routine2 = Routine("Rutina 2", "Practica Ataques Rapidos con Dragon", "null");
  Routine routine3 = Routine("Rutina 3", "Mejora al menos 3 edificios a la semana", "null");
  
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context_) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "clash"
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 169, 169, 11)
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
                          height: 100,
                          child: Text(
                            "Tropa favorita: Dragon Electrico",
                            textScaler: TextScaler.linear(2),
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/CCAssets/troopexample.png")
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
                          clashclansinfo,
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