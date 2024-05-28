import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/modules/home/presenter/user_profil.dart';

import '../modules/home/presenter/homePage.dart';


void main() async {
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        title: "TravelGO",
        home: MyHome() ,
        );

  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List page = [HomePage(), ProfilPage(),HomePage(), ProfilPage()];
  int _selectedIndex = 0;
  void _onTapItem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Color.fromRGBO(42, 21, 232, 1),
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onTapItem,
          items: [
            BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                    (_selectedIndex == 0) ? Icons.home : Icons.home_outlined),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Notifs',
                icon: Icon((_selectedIndex == 1)
                    ? Icons.notifications
                    : Icons.notifications_none),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Favoris',
                icon: Icon((_selectedIndex == 2)
                    ? Icons.favorite
                    : Icons.favorite_outline),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Profil',
                icon: Icon((_selectedIndex == 3)
                    ? Icons.person
                    : Icons.person_outline),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
          ]),
    );
  }
}