import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/login_screen.dart';
import 'package:prod_software_rutinator/pantallas/screen1.dart';
import 'package:prod_software_rutinator/pantallas/screen2.dart';
import 'package:prod_software_rutinator/pantallas/screen3.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

class MainScreen extends StatelessWidget{

  const MainScreen({super.key, required this.userdb});

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
      home: MyHomePage(userdb: userdb,),
      
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.userdb});
  final Userdatabase userdb;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() => MyMainScreen(userdb: userdb);
}

class MyMainScreen extends State<MyHomePage> {
  MyMainScreen({required this.userdb});

  final Userdatabase userdb;
  int _currentIndex = 0;

  Color textColor = Colors.white;
  void _changeTextColor(){
    setState(() {
      switch(_currentIndex){
        case 0:
          textColor = Colors.white;
        break;
        case 1:
          textColor = Colors.black;
        break;
        case 2:
          textColor = Colors.white;
        break;
      }
    });
  }
  

  PageController _pageController = PageController(initialPage: 0);

  String getCurrentName(){
    return userdb.currentUser!.username!;
  }

  final _navItems = [
    NavigationDestination(icon: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset('assets/brawlAssets/brawlicon.png', width: 30, height: 30,)
      ), 
      label: "Brawl Stars"),
    NavigationDestination(icon: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset('assets/CCAssets/clashclansicon.png', width: 30, height: 30,)
      ), 
      label: "Clash of Clans"),
    NavigationDestination(icon: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset('assets/CRAssets/clashroyaleicon.png', width: 30, height: 30,)
      ), 
      label: "Clash Royale"),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Hola, ${getCurrentName()}",
          style: TextStyle(color: textColor),),
          iconTheme: IconThemeData(color: textColor)
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex){
            setState(() {
              _currentIndex = newIndex;
            });
            _changeTextColor();
          },
          children: [
            Screen1(userdb: userdb,),
            Screen2(userdb: userdb,),
            Screen3(userdb: userdb,)
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          destinations: _navItems,
          onDestinationSelected: (newIndex){
            _pageController.animateToPage(
              newIndex, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.ease);
          },
          surfaceTintColor: Colors.blue,
          indicatorColor: Colors.amber,
          shadowColor: Colors.amberAccent,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(getCurrentName(), 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary.computeLuminance() > 0.5 ? Colors.black : Colors.white)), 
                accountEmail: null,
                currentAccountPicture: const Icon(Icons.face),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
              Card(
                child: ListTile(
                        title: const Text('Cerrar Sesión'),
                        onTap: () {Navigator.pushAndRemoveUntil(
                          context, 
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const LoginScreen()), 
                          (route) => false);},
                      ),
              ),
            ]
          )
        ),
      ),
    );
  }
}

/*

landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          items: _navItems,
          onTap: (newIndex){
            _pageController.animateToPage(
              newIndex, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.ease);
          },

*/