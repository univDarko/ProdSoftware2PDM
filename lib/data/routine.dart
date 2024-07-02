
class Routine{

  String title = "null";
  String descr = "null";
  bool isdone = false;
  String whoiscompleting = "null";

  Routine(String title_, String desc, String name){
    title = title_;
    descr = desc;
    isdone = false;
    whoiscompleting = name;
  }

  String showTitle(){
    return title;
  }

  String showDescription(){
    return descr;
  }

  bool toggleState() => !isdone;

  bool showStateCompletion(){
    return isdone;
  }

  String showUserCompletingRoutine(){
    return whoiscompleting;
  }
}