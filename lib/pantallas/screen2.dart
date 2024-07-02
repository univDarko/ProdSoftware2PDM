import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';
import 'package:prod_software_rutinator/pantallas/routinepage2.dart';

// ignore: must_be_immutable
class Screen2 extends StatelessWidget{
  Screen2({super.key, required this.userdb});

  final Userdatabase userdb;
  
  TextEditingController clashApiController = TextEditingController();

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
                  image: DecorationImage(image: AssetImage("assets/CCAssets/bgscreencc.jpg"), fit: BoxFit.cover),
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
                          image: AssetImage("assets/CCAssets/clashofclanslogo.png"),
                          width: 540,
                          height: 200,
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          "Ingrese su codigo de cuenta de Clash of Clans", 
                          textScaler: TextScaler.linear(2),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: clashApiController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Codigo de Usuario',
                              //errorText: brawlApiController.text.isEmpty ? "Añada su Nombre de Usuario" : null,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.primary,
                              elevation: 1,
                              minimumSize: const Size(100, 50)
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RoutinePage2(userdb: userdb,)));},
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
  }
}