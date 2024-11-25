
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kata_mobile_frontui/Widget/InnerPageTitle.dart';
import 'package:kata_mobile_frontui/Widget/colors.dart';
import 'package:kata_mobile_frontui/Widget/feesNameTitle.dart';
import 'package:kata_mobile_frontui/Widget/numberOfFees.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';
import 'package:kata_mobile_frontui/models/UserModel.dart';
import 'package:kata_mobile_frontui/services/DataService.dart';

import '../constants/theme/colors.materialState.dart';


class HomePage extends StatefulWidget {
  /*final fetchData;*/
  const HomePage({super.key /*required this.fetchData*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SessionService sessionService = SessionService();
  final Dataservice dataservice = Dataservice();
  UserModel? currentUser;
  List<UserModel?>? studentList;


  @override
  void initState() {
    super.initState();
    _initializeUser();
    _getAllStudents();
  }

  Future<void> _initializeUser() async {
    UserModel? user = await sessionService.getCurrentUser();
    setState(() {
      currentUser = user;
    });
  }

  Future<void> _getAllStudents() async {
    final List<UserModel?> students = await dataservice.getAllStudents();
    setState(() {
      studentList = students;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0x00f2f1f6),
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              forceMaterialTransparency: true,
              leading: const Icon(Icons.menu),
              actions: [
                IconButton(
                  onPressed: () {
                    sessionService.removeToken();
                    Navigator.pushNamed(context, routeList.login);
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    size: 36,
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('Hi, ${currentUser?.firstName} !',
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        width: MediaQuery.of(context).size.width * 0.43,

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  width: 37,
                                  height: 37,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FigmaColors.iconsBlue,
                                  ),
                                  child: const Icon(Icons.school, color: Colors.white, size: 25,),
                                ),
                                 Text(
                                  '${studentList?.length}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: FigmaColors.dashboardNumberBlack
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text('Nbre d\'élèves',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: FigmaColors.dashboardSubtitleGrey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(

                        width: MediaQuery.of(context).size.width * 0.43,

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  width: 37,
                                  height: 37,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FigmaColors.iconsRed,
                                  ),
                                  child: const Icon(Icons.event, color: Colors.white, size: 25,),
                                ),
                                const Text(
                                  '8',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 32, color: FigmaColors.dashboardNumberBlack),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text('Évènements',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: FigmaColors.dashboardSubtitleGrey

                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        width: MediaQuery.of(context).size.width * 0.43,

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  width: 37,
                                  height: 37,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FigmaColors.iconsGrey,
                                  ),
                                  child: const Icon(Icons.apartment, color: Colors.white, size: 25,),
                                ),
                                const Text(
                                  '7',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 32, color: FigmaColors.dashboardNumberBlack),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text('Dojos',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: FigmaColors.dashboardSubtitleGrey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(

                        width: MediaQuery.of(context).size.width * 0.43,

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  width: 37,
                                  height: 37,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FigmaColors.iconsGreen,
                                  ),
                                  child: const Icon(Icons.account_balance, color: Colors.white, size: 25,),
                                ),
                                const Text(
                                  '12',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: FigmaColors.dashboardNumberBlack
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text('Paiements',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: FigmaColors.dashboardSubtitleGrey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 38,),
                  const InnerPageTitle(title: 'Mes frais'),
                  Column(
                    children: [
                      ListTile(
                        leading: Container(

                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FigmaColors.iconsOrange,
                          ),
                          child: const Icon(Icons.format_list_bulleted, color: Colors.white, size: 25,),
                        ),
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Feesnametitle(title: 'Examens'),
                            numberOfFees(title: '7'),
                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right, color : FigmaColors.feesSubtitleGrey),
                        contentPadding: const EdgeInsets.all(0),
                        onTap: (){
                          print('Hey');
                        },
                      ),
                      ListTile(
                        leading: Container(

                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FigmaColors.iconsBlue,
                          ),
                          child: const Icon(Icons.format_list_bulleted, color: Colors.white, size: 25,),
                        ),
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Feesnametitle(title: 'Other Fees'),
                            numberOfFees(title: '12'),

                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right, color: FigmaColors.feesSubtitleGrey),
                        contentPadding: const EdgeInsets.all(0),
                        onTap: (){
                          print('Hey');
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
