import 'package:flutter/material.dart';
class MyCustomForm extends StatefulWidget {

  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
