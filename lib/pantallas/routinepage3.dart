import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/routine.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String clashroyaleinfo = "Clash Royale es un videojuego de estrategia en "
"línea para dispositivos móviles, creado por Supercell. Fue lanzado "
"globalmente el 2 de marzo de 2016. Es un videojuego freemium de estrategia en tiempo real basado "
"en los personajes de Clash of Clans. Combina elementos de los juegos de cartas coleccionables y "
"defensa de torres.";

// ignore: must_be_immutable
class RoutinePage3 extends StatelessWidget{
  RoutinePage3({super.key, required this.userdb});

  final Userdatabase userdb;

  String _getusername(){
    return userdb.currentusername!;
  }

  Routine routine1 = Routine("Rutina 1", "Practica Predicción con Flechas", "null");
  Routine routine2 = Routine("Rutina 2", "Practica Ofensivas con Globo y Leñador", "null");
  Routine routine3 = Routine("Rutina 3", "Practica Defensivas con Torre Tesla", "null");
  
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context_) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "clash"
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 117, 251)
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
                          height: 80,
                          child: Text(
                            "Carta favorita: Montapuercos",
                            textScaler: TextScaler.linear(2),
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/CRAssets/cardexample.png")
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
                          clashroyaleinfo,
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
                                'Volver', 
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