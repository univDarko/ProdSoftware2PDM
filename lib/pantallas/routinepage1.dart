import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const String brawlInfo = "Brawl Stars es un videojuego multijugador "
"para móviles disponible en Android y iOS, desarrollado por Supercell y lanzado globalmente en 2018. "
"Con temáticas simples y mecánicas difíciles, "
"visuales con grandes detalles interesantes y diferentes funcionalidades. "
"Actualmente lleva 5 años de existencia en el mundo de los videojuegos móviles.";

class RoutinePage1 extends StatelessWidget{
  const RoutinePage1({super.key, required this.userdb});
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
                          title: Text(userdb.currentUser!.getRoutinesFromGame(1)[0].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(1)[0].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(1)[0].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(1)[0].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(1)[0].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(1)[1].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(1)[1].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(1)[1].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(1)[1].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(1)[1].changeProgress = value;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.water),
                          title: Text(userdb.currentUser!.getRoutinesFromGame(1)[2].title),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(userdb.currentUser!.getRoutinesFromGame(1)[2].descr),
                              Slider(
                                value: userdb.currentUser!.getRoutinesFromGame(1)[2].progress,
                                max: 100,
                                divisions: 100,
                                label: userdb.currentUser!.getRoutinesFromGame(1)[2].progress.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    userdb.currentUser!.getRoutinesFromGame(1)[2].changeProgress = value;
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