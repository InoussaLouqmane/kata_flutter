import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kata_mobile_frontui/core/constants/theme/colors.materialState.dart';

import '../../Widget/SectionTitle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            forceMaterialTransparency: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  size: 36,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi, Deodat04!',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 170,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: indigoClassique,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Evènements',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    InkWell(
                      child:Text('voir tout(18)',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,color: indigoClassique),
                      ) ,
                      onTap: (){},
                    )

                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          height: 134,
                          width: 210,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: const BorderRadius.all(Radius.circular(12))
                          ),
                        );
                      }),
                )



              ],
            ),
          )
        ],
      ),),
    ));
  }
}
