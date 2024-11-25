import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';
import 'package:kata_mobile_frontui/constants/theme/colors.materialState.dart';
import 'package:kata_mobile_frontui/services/chargeNotifications.dart';
import '../Widget/SectionTitle.dart';
import '../models/AccountRequestModel.dart';

class NotificationPage extends StatefulWidget {
  final fetchData;
  const NotificationPage({super.key, required this.fetchData});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  late Future<List<AccountRequestModel>> accountRequests;

  @override
  void initState() {
    super.initState();
    //accountRequests = fetchAccountRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<AccountRequestModel>>(
          future: accountRequests,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: indigoClassique),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erreur : ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Aucune donnée disponible'),
              );
            } else {
              List<AccountRequestModel> data = snapshot.data!;
              return Column(
                children: [
                  AppBar(
                    shape: const Border(
                      bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                    ),
                    forceMaterialTransparency: true,
                    title: const SectionTitle(textContent: 'Notifications'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var username =
                            "${data[index].firstName} + ${data[index].lastName}";
                        var clubName = data[index].clubName;
                        return InkWell(
                          key: UniqueKey(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              routeList.notificationDetails,
                              arguments: data[index],
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                              ),
                            ),
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, bottom: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color.fromRGBO(207, 218, 255, 1),
                                      ),
                                      child: const Icon(
                                        Icons.notifications_outlined,
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Validation de Compte Sensei',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Nouvelle demande de $username',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          clubName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(height: 15,),
                                        const Text(
                                          'Il y a 1h',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(height: 15,),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
