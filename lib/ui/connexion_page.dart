import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';
import 'package:kata_mobile_frontui/services/authService.dart';
import 'package:kata_mobile_frontui/ui/chooseAccountPage.dart';

import '../Widget/LoadingButton.dart';
import '../configs/sharedpreferences.dart';
import '../constants/theme/colors.materialState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController mailKey = TextEditingController();
  final TextEditingController passwordKey = TextEditingController();
  final TextEditingController resetPasswordKey = TextEditingController();
  final TextEditingController confirmPasswordKey = TextEditingController();


  @override
  void dispose() {
    mailKey.dispose();
    passwordKey.dispose();
    resetPasswordKey.dispose();
    confirmPasswordKey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedForm = 0;
    return Scaffold(
      body: Container(
        color: Colors.indigo.shade700,
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/logo_kata_white.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 40,
                        width: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/karate_labs.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 184,
                        width: 153,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.55,
                minChildSize: 0.55,
                maxChildSize: 0.9,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width / 12,
                                    decoration: BoxDecoration(
                                        color: Colors.indigo.shade700,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              _buildLoginForm(),
                              const SizedBox(height: 10,),
                              if(selectedForm == 0) Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Vous n'avez pas de compte ?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 5,),
                                   InkWell(
                                    onTap:  NavigaTo,
                                    child: const Text(
                                      "Inscrivez-vous",
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                alignment: Alignment.center,
                              )
                            ],
                          );
                        }),
                  );
                })
          ],
        )),
      ),
    );
  }

   NavigaTo(){
    Navigator.of(context).pushNamed(routeList.chooseAccount);
  }

  Widget _buildLoginForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, Bienvenu !',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Form(
          key: loginFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(

                controller: mailKey,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.all(12),
                  floatingLabelBehavior:
                  FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: indigoClassique,
                  ),
                  hintText: 'Entrez votre adresse mail',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  label: const Text(
                    'E-mail',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(
                              0, 0, 0, 0.25),
                          width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@')) {
                    return 'Adresse mail invalid';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordKey,
                keyboardType:
                TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.all(12),
                  floatingLabelBehavior:
                  FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: indigoClassique,
                  ),
                  hintText: 'Votre mot de passe',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  label: const Text('Mot de passe',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(
                              0, 0, 0, 0.25),
                          width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est requis';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Mot de passe oublié?',
          style: TextStyle(
            color: Colors.indigo.shade700,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 20,
        ),
        LoadingButton(
          onPressed: checkCredential,
          buttonContent: 'Se connecter',
          formKey: loginFormKey,
          emailController: mailKey,
          passwordController: passwordKey,
        ),
      ],);
  }

  Widget _buildResetPassword(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Réinitialisez votre mot de passe',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Form(
          key: resetPasswordFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: resetPasswordKey,
                keyboardType:
                TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.all(12),
                  floatingLabelBehavior:
                  FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: indigoClassique,
                  ),
                  hintText: 'Nouveau mot de passe',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  label: const Text('Nouveau mot de passe',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(
                              0, 0, 0, 0.25),
                          width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: confirmPasswordKey,
                keyboardType:
                TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.all(12),
                  floatingLabelBehavior:
                  FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: indigoClassique,
                  ),
                  hintText: 'Confirmer mot de passe',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  label: const Text('Confirmer mot de passe',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(
                              0, 0, 0, 0.25),
                          width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est requis';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        const SizedBox(
          height: 20,
        ),
        LoadingButton(
          onPressed: checkCredential,
          buttonContent: 'Continuer',
          formKey: resetPasswordFormKey,
          emailController: mailKey,
          passwordController: passwordKey,
        ),
      ],
    );
  }
}
