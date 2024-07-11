import 'package:prod_software_rutinator/data/user.dart';

class Userdatabase{

  List<User> listUsers = [];
  User? currentUser;

  Userdatabase();

  bool checkIfExists(User user_){
    for (var user in listUsers) {
      if (user_.username == user.username){
        return true;
      }
    }

    return false;
  }

  bool checkIfCorrectPass(User user_, String passAttempt){
    for (var user in listUsers) {
      if (user_.username == user.username && user.getpass == passAttempt){
        return true;
      }
    }

    return false;
  }

  void addUser(User user_){
    listUsers.add(user_);
  }

  void setCurrentUser(User user_){
    currentUser = user_;
  }

  String? get currentusername{
    return currentUser!.username;
  }

}