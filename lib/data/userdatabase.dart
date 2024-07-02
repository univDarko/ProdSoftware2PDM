import 'package:prod_software_rutinator/data/user.dart';

class Userdatabase{

  List<User> listUsers = [];
  User? currentUser;

  Userdatabase();

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