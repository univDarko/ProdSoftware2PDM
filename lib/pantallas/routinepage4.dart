import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

//SquadBusters
const String squadbustersinfo = "Squad Busters es un videojuego móvil desarrollado por Supercell. "
"Squad Busters incluye personajes de los juegos de Supercell: Clash of Clans, Hay Day, Boom Beach, Clash Royale y Brawl Stars. "
"Fue lanzado por primera vez en fase beta el 6 de febrero de 2023 en Canadá y en dispositivos Android, durante 10 días. "
"El 25 de abril de 2024, Supercell anunció el lanzamiento global del juego para el 29 de mayo de 2024, " 
"convirtiéndose en el sexto videojuego móvil de la compañía en ser lanzado mundialmente.";

class RoutinePage4 extends StatelessWidget{
  const RoutinePage4({super.key, required this.userdb});
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

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context_) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 251, 5)
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
                            "Personaje Favorito: Chicken",
                            textScaler: TextScaler.linear(2),
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/SBAssets/characterexample.png")
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(4)[0].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(4)[0].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(4)[0].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(4)[0].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(4)[0].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(4)[1].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(4)[1].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(4)[1].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(4)[1].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(4)[1].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(4)[2].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(4)[2].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(4)[2].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(4)[2].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(4)[2].changeProgress = value;
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
                          squadbustersinfo,
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