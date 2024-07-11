class Routine{

  String title = "null";
  String descr = "null";
  double progress = 0;
  int diff = 0;
  int fromGame = 0;

  Routine(String title_, String desc, int difficulty, int fromgame){
    title = title_;
    descr = desc;
    progress = 0;

    //1 = easy, 2 = med, 3 = hard
    diff = difficulty;
    //1 = BS, 2 = CC, 3 = CR, 4 = SB 
    fromGame = fromgame;
  }

  String get showTitle{
    return title;
  }

  String get showDescription{
    return descr;
  }

  double get progressrate{
    return progress;
  }

  set changeProgress(double to){
    progress = to;
  }

  bool showStateCompletion(){
    return progress >= 100 ? true : false;
  }
}