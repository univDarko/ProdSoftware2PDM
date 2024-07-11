import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/routinepage1.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

// ignore: must_be_immutable
class Screen1 extends StatelessWidget{
  Screen1({super.key, required this.userdb});

  final Userdatabase userdb;

  TextEditingController brawlApiController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/brawlAssets/bgscreenbrawl.png"), fit: BoxFit.cover),
                ),
                constraints: const BoxConstraints(
                  minHeight: 800,
                ),
                child: Center(
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                          image: AssetImage("assets/brawlAssets/brawllogo.png"),
                          width: 270,
                          height: 180,
                        ),
                        const Text(
                          "Progreso de Rutina:", 
                          textScaler: TextScaler.linear(2),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 150,
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  userdb.currentUser!.getMostAdvancedRoutine(1).descr,
                                  textAlign: TextAlign.center,
                                  textScaler: const TextScaler.linear(1.3),
                                  ),
                                Slider(
                                  value: userdb.currentUser!.getMostAdvancedRoutine(1).progress,
                                  max: 100,
                                  divisions: 100,
                                  label: userdb.currentUser!.getMostAdvancedRoutine(1).progress.round().toString(),
                                  onChanged: null
                                )
                              ],
                            ),
                          )
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.primary,
                              elevation: 1,
                              minimumSize: const Size(100, 50)
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RoutinePage1(userdb: userdb,)));},
                          child: const Text('Crear Rutinas', textScaler: TextScaler.linear(1.5),),
                        ),
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

    /*
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/brawlAssets/bgscreenbrawl.png"), fit: BoxFit.cover),
      ),
    );
    */
  }
}