

class User{

  // ignore: unused_field
  String? _name;
  String? surname;
  String? username;
  String? email;
  String? _password;
  
  User(String name_, String surname_, String username_, String email_, String password_){
    _name = name_;
    surname = surname_;
    username = username_;
    email = email_;
    _password = password_;
  }

  String get getemail{
    return email!;
  }

  String get getpass{
    return _password!;
  }
}