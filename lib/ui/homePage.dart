import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/InnerPageTitle.dart';
import '../Widget/colors.dart';
import '../Widget/feesNameTitle.dart';
import '../Widget/numberOfFees.dart';
import '../configs/routes.dart';
import '../configs/sharedpreferences.dart';
import '../models/UserModel.dart';
import '../services/DataService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    try {
      UserModel? user = await sessionService.getCurrentUser();
      setState(() {
        currentUser = user;
      });
    } catch (e) {
      print('Erreur lors de l\'initialisation de l\'utilisateur : $e');
    }
  }

  Future<void> _getAllStudents() async {
    try {
      final List<UserModel?> students = await dataservice.getAllStudents();
      setState(() {
        studentList = students;
      });
    } catch (e) {
      print('Erreur lors de la récupération des étudiants : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
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
                      Navigator.pushNamedAndRemoveUntil(context, routeList.login, (route) => false);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${currentUser?.firstName} !',
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard(
                          icon: Icons.school,
                          color: FigmaColors.iconsBlue,
                          value: '${studentList?.length}',
                          label: 'Nbre d\'élèves',
                          width: screenWidth * 0.43,
                        ),
                        _buildStatCard(
                          icon: Icons.event,
                          color: FigmaColors.iconsRed,
                          value: '8',
                          label: 'Évènements',
                          width: screenWidth * 0.43,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard(
                          icon: Icons.apartment,
                          color: FigmaColors.iconsGrey,
                          value: '7',
                          label: 'Dojos',
                          width: screenWidth * 0.43,
                        ),
                        _buildStatCard(
                          icon: Icons.account_balance,
                          color: FigmaColors.iconsGreen,
                          value: '12',
                          label: 'Paiements',
                          width: screenWidth * 0.43,
                        ),
                      ],
                    ),
                    const SizedBox(height: 38),
                    const InnerPageTitle(title: 'Mes frais'),
                    Column(
                      children: [
                        _buildFeeTile(
                          icon: Icons.format_list_bulleted,
                          color: FigmaColors.iconsOrange,
                          title: 'Examens',
                          value: '7',
                        ),
                        _buildFeeTile(
                          icon: Icons.format_list_bulleted,
                          color: FigmaColors.iconsBlue,
                          title: 'Other Fees',
                          value: '12',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color color,
    required String value,
    required String label,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Icon(icon, color: Colors.white, size: 25),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: FigmaColors.dashboardNumberBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: FigmaColors.dashboardSubtitleGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeeTile({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white, size: 25),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Feesnametitle(title: title),
          numberOfFees(title: value),
        ],
      ),
      trailing: const Icon(Icons.chevron_right, color: FigmaColors.feesSubtitleGrey),
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        print('Hey');
      },
    );
  }
}