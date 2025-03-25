import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/loader.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';
import 'package:kata_mobile_frontui/services/DataService.dart';
import 'package:kata_mobile_frontui/ui/coursePage.dart';
import 'package:kata_mobile_frontui/ui/notifications.dart';
import 'package:kata_mobile_frontui/ui/user_profil.dart';
import 'configs/routes.dart';
import 'constants/theme/colors.materialState.dart';
import 'ui/homePage.dart';
import 'ui/connexion_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool authenticated = false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  if (kDebugMode) {
    print("This is the fcm token $fcmToken");
  }

  try {
    String? token = await SessionService().getToken();
    authenticated = (token != null);
    if (authenticated) {
      if (kDebugMode) {
        print('token found');
      }
    } else {
      if (kDebugMode) {
        print("Sorry, authentication token not found");
      }
    }

  } catch (e) {
    if (kDebugMode) {
      print('token not found!');
    }
  }
  runApp(MyApp(authenticated: authenticated));
}

class MyApp extends StatelessWidget {
  final bool authenticated;
  const MyApp({super.key, required this.authenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      title: "Nothing here",
      initialRoute: (authenticated ? routeList.main : routeList.login),
      routes: routeMap,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List page = [
    HomePage()
  ];
  int _selectedIndex = 0;
  bool isDataLoaded = false;
  var loadedData;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {

    _loadData();
  }

  Future<void> _loadData() async {
    Dataservice dataserviceObject = new Dataservice();
    try {



      setState(() {
        isDataLoaded = true;

        if(isDataLoaded){
          if (kDebugMode) {
            print('Data has been loaded');
          }
        }
        page = [
          HomePage(),
          Videopage(),
          HomePage(),
          LoginPage(),
          /*NotificationPage(fetchData: loadedData)*/
          ProfilePage(),
        ];
      });

      print("Everything is okay for students");
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors du chargement des données students : $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectedIndex] as Widget?,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onTapItem,
        selectedIndex: _selectedIndex,
        indicatorColor: indigoClassique,
        backgroundColor: Colors.white,
        indicatorShape: const CircleBorder(),
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
              icon: Icon(size: 25, Icons.school_outlined),
              selectedIcon: Icon(size: 25, color: Colors.white, Icons.school)),
          NavigationDestination(
              label: 'Favoris',
              icon: Icon(size: 25, Icons.payment_outlined),
              selectedIcon: Icon(size: 25, color: Colors.white, Icons.payment)),
          NavigationDestination(
            label: 'Profil',
            icon: Icon(size: 25, Icons.notifications_outlined),
            selectedIcon:
                Icon(size: 25, color: Colors.white, Icons.notifications),
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
