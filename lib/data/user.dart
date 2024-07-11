import 'package:path/path.dart';
import 'package:prod_software_rutinator/data/routine.dart';

class User{

  // ignore: unused_field
  String? username;
  String? email;
  String? _password;
  List<Routine> listRoutines = [];
  
  User(String username_, String email_, String password_){
    username = username_;
    email = email_;
    _password = password_;

    Routine routine1 = Routine("Rutina 1", "Practica tiro con Este personaje", 1, 1);
    Routine routine2 = Routine("Rutina 2", "Practica evasión con Este personaje", 2, 1);
    Routine routine3 = Routine("Rutina 3", "Practica lanza con Este personaje", 3, 1);

    Routine routine4 = Routine("Rutina 1", "Practica estrategias con Reina Arquera", 2, 2);
    Routine routine5 = Routine("Rutina 2", "Practica Ataques Rapidos con Dragon", 1, 2);
    Routine routine6 = Routine("Rutina 3", "Mejora al menos 3 edificios a la semana", 3, 2);

    Routine routine7 = Routine("Rutina 1", "Practica Predicción con Flechas", 1, 3);
    Routine routine8 = Routine("Rutina 2", "Practica Ofensivas con Globo y Leñador", 3, 3);
    Routine routine9 = Routine("Rutina 3", "Practica Defensivas con Torre Tesla", 2, 3);

    Routine routine10 = Routine("Rutina 1", "Incrementa tu Squad en 3 en menos de 1 minuto", 2, 4);
    Routine routine11 = Routine("Rutina 2", "Tala arboles y obten gemas en 1 minuto", 1, 4);
    Routine routine12 = Routine("Rutina 3", "Practica movimientos estrategicos para derrotar a Squads", 3, 4);

    listRoutines.add(routine1);
    listRoutines.add(routine2);
    listRoutines.add(routine3);
    listRoutines.add(routine4);
    listRoutines.add(routine5);
    listRoutines.add(routine6);
    listRoutines.add(routine7);
    listRoutines.add(routine8);
    listRoutines.add(routine9);
    listRoutines.add(routine10);
    listRoutines.add(routine11);
    listRoutines.add(routine12);
    
  }

  String get getemail{
    return email!;
  }

  String get getpass{
    return _password!;
  }

  Routine? getFirstRoutineFromGame(int currentGame){
    for (var routine in listRoutines) {
      if (routine.fromGame == currentGame){
        return routine;
      }
    }

    return null;
  }

  List<Routine> getRoutinesFromGame(int currentGame){
    List<Routine> list = [];

    for (var routine in listRoutines) {
      if (routine.fromGame == currentGame){
        list.add(routine);
      }
    }

    return list;
  }

  Routine getMostAdvancedRoutine(int currentGame){
    Routine auxR = Routine("null", "null", 0, 0);
    for (var routine in listRoutines) {
      if (routine.progress >= auxR.progress && routine.fromGame == currentGame){
        auxR = routine;
      }
    }

    return auxR;
  }
}