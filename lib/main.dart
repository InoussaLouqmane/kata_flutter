import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/core/constants/theme/colors.materialState.dart';
import 'package:kata_mobile_frontui/modules/home/presenter/notifications.dart';
import 'package:kata_mobile_frontui/modules/home/presenter/user_profil.dart';

import '../modules/home/presenter/homePage.dart';
import 'core/configs/routes.dart';
import 'modules/auth/presenter/connexion_page.dart';

void main() async {
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      title: "Nothing here",
      routerConfig: router,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List page = [HomePage(), ProfilPage(), LoginPage(), NotificationPage(), HomePage()];
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onTapItem,
        selectedIndex: _selectedIndex,
        indicatorColor: indigoClassique,
        backgroundColor: Colors.white,
        indicatorShape: CircleBorder(),
        height: 62,
        elevation: 2.0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            label: 'Accueil',
            icon: Icon(size: 25, Icons.home_outlined),
            selectedIcon: Icon(size: 25, color: Colors.white, Icons.home),
          ),
          NavigationDestination(
              label: 'Cours',
              icon: Icon(size: 25,Icons.school_outlined),
              selectedIcon:
                  Icon(size: 25, color: Colors.white, Icons.school)),
          NavigationDestination(
              label: 'Favoris',
              icon: Icon(size: 25,  Icons.payment_outlined),
              selectedIcon:
                  Icon(size: 25, color: Colors.white, Icons.payment)),
          NavigationDestination(
            label: 'Profil',
            icon: Icon(size: 25, Icons.notifications_outlined),
            selectedIcon: Icon(size: 25, color: Colors.white, Icons.notifications),
          ),
          NavigationDestination(
            label: 'Profil',
            icon: Icon(size: 25, Icons.person_outline),
            selectedIcon: Icon(size: 25, color: Colors.white, Icons.person),
          ),
        ],
      ),

      /*BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            onTap: _onTapItem,
            items: [
              BottomNavigationBarItem(
                  label: 'Accueil',
                  icon: Icon(
                      (_selectedIndex == 0) ? Icons.home : Icons.home_outlined),
                  backgroundColor: indigoClassique),
              BottomNavigationBarItem(
                  label: 'Notifs',
                  icon: Icon((_selectedIndex == 1)
                      ? Icons.notifications
                      : Icons.notifications_none),
                  backgroundColor: indigoClassique),
              BottomNavigationBarItem(
                  label: 'Favoris',
                  icon: Icon((_selectedIndex == 2)
                      ? Icons.favorite
                      : Icons.favorite_outline),
                  backgroundColor: indigoClassique),
              BottomNavigationBarItem(
                  label: 'Profil',
                  icon: Icon((_selectedIndex == 3)
                      ? Icons.person
                      : Icons.person_outline),
                  backgroundColor: indigoClassique),
            ])*/
    );
  }
}
