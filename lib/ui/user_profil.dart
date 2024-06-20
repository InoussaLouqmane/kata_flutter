
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {


  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
          ],
          centerTitle: true,
          title: const Text("TravelGO"),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: const Icon(Icons.grid_view),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          })),

      body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(0.0),
          )),
      resizeToAvoidBottomInset: false,
    );
  }


}