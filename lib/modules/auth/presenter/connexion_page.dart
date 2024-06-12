import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kata_mobile_frontui/core/constants/theme/colors.materialState.dart';
import 'package:kata_mobile_frontui/modules/Widget/LoadingButton.dart';
import 'package:kata_mobile_frontui/modules/Widget/LoginInput.dart';
import 'package:kata_mobile_frontui/modules/auth/Logic/auth_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController mailKey = TextEditingController();
  final TextEditingController passwordKey = TextEditingController();

  @override
  void dispose() {
    mailKey.dispose();
    passwordKey.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


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
                        const EdgeInsets.only(left: 40, right: 40, top: 10),
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
                              SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Hello, Bienvenu !',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(

                                      controller: mailKey,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(12),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: indigoClassique,
                                        ),
                                        hintText: 'Entrez votre adresse mail',
                                        hintStyle: TextStyle(
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
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty || !value.contains('@')) {
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
                                        contentPadding: EdgeInsets.all(12),
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
                                formKey: formKey,
                                emailController: mailKey,
                                passwordController: passwordKey,
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
}
