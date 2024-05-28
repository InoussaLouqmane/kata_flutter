
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(42, 21, 232, 1),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          ],
          centerTitle: true,
          title: Text("TravelGO"),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          })),

      body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            //height: xHeight / 10,
            padding: EdgeInsets.all(0.0),
          )),
      resizeToAvoidBottomInset: false,
    );
  }

}


