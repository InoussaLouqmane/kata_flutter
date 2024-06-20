import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';
import '../Widget/SectionTitle.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(42, 21, 232, 1),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          ],
          centerTitle: true,
          title: Text("Notifications"),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          })),*/

      body: SafeArea(
          child: Column(
        children: [
          AppBar(
           shape: const Border(
             bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))
           ) ,
            forceMaterialTransparency: true,
            title: const SectionTitle(textContent: 'Notifications'),
          ),
          Expanded(
            child: ListView.builder(

              itemCount: 15,
              itemBuilder: (context, index) {
                return InkWell(
                  key: UniqueKey(),
                  onTap: () {
                    Navigator.pushNamed(context, routeList.notificationDetails);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                    ),
                    padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20, right: 20),
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
                                  color: const Color.fromRGBO(207, 218, 255, 1)),
                              child: const Icon(
                                Icons.notifications_outlined,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Validation de Compte Sensei',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Nouvelle demande de Jean dupont',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                                Text(
                                  'Benito Karate Club',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),

                                SizedBox(height: 15,),
                                Text(
                                  'Il y a 1h',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                                SizedBox(height: 15,),


                              ],
                            ),
                          ],
                        ),
                        Container(

                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
      resizeToAvoidBottomInset: false,
    );
  }
}
