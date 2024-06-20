import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kata_mobile_frontui/ui/AccountRequestDetailsPage.dart';
import 'package:kata_mobile_frontui/ui/chooseAccountPage.dart';
import 'package:kata_mobile_frontui/ui/connexion_page.dart';
import 'package:kata_mobile_frontui/ui/homePage.dart';

import '../../main.dart';


class routeList {
  static String login = '/login';
  static String homepage = '/home';
  static const String chooseAccount = "/accountChoice";
  static const String main= '/main';
  static const String notificationDetails='/notifications_details';
}

Map<String, Widget Function(BuildContext context)> routeMap = {
  routeList.main : (context)=> const MyHome(),
  routeList.homepage : (context)=> const HomePage(),
  routeList.login : (context)=>const LoginPage(),
  routeList.chooseAccount : (context) => const ChooseAccountPage(),
  routeList.notificationDetails: (context) => const AccountRequestDetailsPage(),
};


