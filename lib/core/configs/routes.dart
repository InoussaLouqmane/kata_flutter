import 'package:go_router/go_router.dart';
import 'package:kata_mobile_frontui/modules/auth/presenter/connexion_page.dart';
import 'package:kata_mobile_frontui/modules/home/presenter/homePage.dart';

import '../../main.dart';


class routeList {
  static String login = '/login';
  static String homepage = "/home";
}
final GoRouter router = GoRouter(
    initialLocation: routeList.homepage,
    routes: [
      GoRoute(path: routeList.login, builder: ((context, state) => const LoginPage())),
      GoRoute(
        path: routeList.homepage, builder: ((context, state) => const MyHome())
      )
    ]);
