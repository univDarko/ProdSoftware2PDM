import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String clashclansinfo = "Clash of Clans "
"es un videojuego de estrategia y de construcción de aldeas en línea, para dispositivos móviles con "
"plataformas de iOS y Android. Fue desarrollado por Supercell y lanzado para dispositivos iOS el 2 de agosto del 2012, "
"y el 8 de octubre para dispositivos Android. En este mismo juego se basó "
"Clash Royale.";

class RoutinePage2 extends StatelessWidget{
  const RoutinePage2({super.key, required this.userdb});
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
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(2)[0].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(2)[0].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(2)[0].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(2)[0].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(2)[0].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(2)[0].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(2)[1].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(2)[1].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(2)[1].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(2)[1].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(2)[1].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(2)[1].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(iconPick(userdb.currentUser!.getRoutinesFromGame(2)[2].diff)),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(2)[2].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(2)[2].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(2)[2].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(2)[2].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(2)[2].changeProgress = value;
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
                              onPressed: () {Navigator.pop(context);},
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
      );
  }
}