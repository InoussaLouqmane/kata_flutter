
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';

import '../constants/theme/colors.materialState.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SessionService sessionService = SessionService();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF2F1F6),
        body: SafeArea(
      child: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            forceMaterialTransparency: true,
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
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, Robert !',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      width: MediaQuery.of(context).size.width * 0.43,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.account_circle),
                              Text('7')
                            ],
                          ),
                          Text('Events',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width * 0.43,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.account_circle),
                              Text('7')
                            ],
                          ),
                          Text('Events',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),),
    ));
  }
}
