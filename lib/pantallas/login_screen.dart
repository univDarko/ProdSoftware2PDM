import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/main_screen.dart';
import 'package:prod_software_rutinator/data/user.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

const Userdatabase? userdb = null;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.userdb});

  final Userdatabase userdb;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutinator',
      theme: ThemeData(
        fontFamily: 'Custom',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: StatefulLoginPage(userdb: userdb,),
    );
  }
}
 
class StatefulLoginPage extends StatefulWidget {
  const StatefulLoginPage({super.key, required this.userdb});

  final Userdatabase userdb;
 
  @override
  State<StatefulLoginPage> createState() => _MyStatefulLoginPage(userdb: userdb);
}
 
class _MyStatefulLoginPage extends State<StatefulLoginPage> {

  _MyStatefulLoginPage({required this.userdb});
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Userdatabase userdb;

  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;
  bool wrongPass = false;

  bool checkEmptyField(){
    setState(() {
      isUsernameEmpty = nameController.text.isEmpty;
      isPasswordEmpty = passwordController.text.isEmpty;
    });
    if (isUsernameEmpty || isPasswordEmpty){
      return false;
    }
    else{
      return true;
    } 
  }

  String? userErrMsgs(){
    if (isUsernameEmpty){
      return "Añada su Nombre de Usuario";
    }
    return null;
  }

  String? passErrMsgs(){
    if (isPasswordEmpty){
      return "Escriba su Contraseña";
    }

    if (wrongPass){
      return "Contraseña Incorrecta";
    }

    return null;
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Rutinator",
            style: TextStyle(
              color: Color.fromARGB(255, 237, 28, 36),
              fontWeight: FontWeight.w500,
              fontSize: 25
            )
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Inicio de Sesión',
                  style: TextStyle(fontSize: 20),
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Nombre de Usuario',
                    errorText: userErrMsgs(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Contraseña',
                    errorText: passErrMsgs(),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('¿Olvidó su Contraseña?',),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Iniciar Sesión'),
                  onPressed: () {
                    if (checkEmptyField()){
                      wrongPass = false;
                      User newuser = User(nameController.text, 'none', passwordController.text);
                      if (userdb.checkIfExists(newuser)){
                        print(newuser.username);
                        print("Existe");
                        if (userdb.checkIfCorrectPass(newuser, passwordController.text)){
                          print("Contraseña correcta.");
                          userdb.setCurrentUser(newuser);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(userdb: userdb)));
                        }
                        else{
                          print("Contraseña incorrecta.");
                          wrongPass = true;
                        }
                      }
                      else{
                        print("Usuario no existe. Creando.");
                        userdb.addUser(newuser);
                        userdb.setCurrentUser(newuser);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(userdb: userdb)));
                      }
                    }
                  },
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                const Text('¿No tiene cuenta?'),
                  TextButton(
                    child: const Text(
                        'Crear Cuenta',
                        style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                    //signup screen
                    },
                  )
                ],
              ),
            ],
          )
        )
      )
    );
  }
}
