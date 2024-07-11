import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String clashroyaleinfo = "Clash Royale es un videojuego de estrategia en "
"línea para dispositivos móviles, creado por Supercell. Fue lanzado "
"globalmente el 2 de marzo de 2016. Es un videojuego freemium de estrategia en tiempo real basado "
"en los personajes de Clash of Clans. Combina elementos de los juegos de cartas coleccionables y "
"defensa de torres.";

class RoutinePage3 extends StatelessWidget{
  const RoutinePage3({super.key, required this.userdb});
  final Userdatabase userdb;

  @override
  Widget build(BuildContext context){
    return RoutinePage(userdb: userdb,);
  }
}

class RoutinePage extends StatefulWidget{
  const RoutinePage({super.key, required this.userdb});
  final Userdatabase userdb;

  @override
  // ignore: no_logic_in_create_state
  State<RoutinePage> createState() => RoutinePageState(userdb: userdb,);
}

// ignore: must_be_immutable
class RoutinePageState extends State<RoutinePage>{
  RoutinePageState({required this.userdb});

  final Userdatabase userdb;

  String _getusername(){
    return userdb.currentusername!;
  }

  IconData? iconPick(int difficulty){
    switch (difficulty){
      case 1:
        return Icons.sentiment_very_satisfied_sharp;
      break;
      case 2:
        return Icons.waves_outlined;
      break;
      case 3:
        return Icons.local_fire_department_sharp;
      break;
    }

    return null;
  }
  
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context_) {
    return Scaffold(
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
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(3)[0].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(3)[0].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(3)[0].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(3)[0].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(3)[0].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(3)[0].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(3)[1].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(3)[1].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(3)[1].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(3)[1].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(3)[1].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(3)[1].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(3)[2].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(3)[2].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(3)[2].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(3)[2].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(3)[2].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(3)[2].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
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
                              onPressed: () {Navigator.pop(context);},
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
    );
  }
}