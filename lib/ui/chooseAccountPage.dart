import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kata_mobile_frontui/Widget/LoadingButton.dart';
import 'package:kata_mobile_frontui/Widget/SimpleLoadingButton.dart';
import 'package:kata_mobile_frontui/Widget/Snackbars.dart';
import 'package:kata_mobile_frontui/constants/theme/colors.materialState.dart';
import 'package:kata_mobile_frontui/models/AccountRequestModel.dart';
import 'package:kata_mobile_frontui/services/AccountRequestService.dart';

class ChooseAccountPage extends StatefulWidget {
  const ChooseAccountPage({super.key});

  @override
  State<ChooseAccountPage> createState() => _ChooseAccountPageState();
}

class _ChooseAccountPageState extends State<ChooseAccountPage> {
  bool SenseiSelected = true;
  int steps = 0;
  final personalDataformKey = GlobalKey<FormState>();
  final clubDataformkey = GlobalKey<FormState>();
  final TextEditingController mailKey = TextEditingController();
  final TextEditingController disciplineKey = TextEditingController();
  final TextEditingController firstNameKey = TextEditingController();
  final TextEditingController lastNameKey = TextEditingController();
  final TextEditingController phoneKey = TextEditingController();
  final TextEditingController licenseKey = TextEditingController();
  final TextEditingController clubNameKey = TextEditingController();
  final TextEditingController clubAddressKey = TextEditingController();
  final TextEditingController gradeKey = TextEditingController();
  final TextEditingController martialArtTypeKey = TextEditingController();
  final String _preSelectedMartialArt = 'Karaté';
  final String _preSelectedGrade = '1 Dan';
  final AccountRequestModel demandeCreationDeCompte = AccountRequestModel();

  @override
  void dispose() {
    mailKey.dispose();
    disciplineKey.dispose();
    firstNameKey.dispose();
    lastNameKey.dispose();
    phoneKey.dispose();
    licenseKey.dispose();
    clubNameKey.dispose();
    clubAddressKey.dispose();

    super.dispose();
  }

  Future<void> _nextStep() async {

    print("current is $steps");

    if (steps < 3) {
      if (steps == 0) {
        setState(() {
          steps++;
        });
      }
      if (steps == 1 && (personalDataformKey.currentState?.validate() ?? false)) {
        setState(() {
          steps++;
        });
      }

      if (steps == 2 && (clubDataformkey.currentState?.validate() ?? false)) {

        demandeCreationDeCompte.firstName = firstNameKey.text;
        demandeCreationDeCompte.lastName = lastNameKey.text;
        demandeCreationDeCompte.email = mailKey.text;
        demandeCreationDeCompte.martialArtType = martialArtTypeKey.text;
        demandeCreationDeCompte.grade = gradeKey.text;
        demandeCreationDeCompte.clubName = clubNameKey.text;
        demandeCreationDeCompte.clubAddress = clubAddressKey.text;
        demandeCreationDeCompte.licenseId = licenseKey.text;
        demandeCreationDeCompte.role = (SenseiSelected) ? 'Sensei' : 'Elève';


        AccountRequestService accountRequestService = AccountRequestService( AccountRequest: demandeCreationDeCompte);
        int everyThingIsFine = await accountRequestService.sentRequest();

        if(everyThingIsFine != 200){
          ScaffoldMessenger.of(context).showSnackBar(returnErrorSnackbar(context, 'An error occured'));
        }
        setState(() {
          steps++;
        });
      }

    } else {
      Navigator.pop(context);
    }
  }

  void _previousStep() {
    if (steps > 0) {
      setState(() {
        steps--;
      });
      print(steps);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        } else {
          if (steps >= 1)
            _previousStep();
          else {
            Navigator.pop(context);
          }
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            border: const Border(
                              bottom:
                                  BorderSide(color: Colors.indigo, width: 4.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                              bottom: BorderSide(
                                  color: (steps >= 1)
                                      ? Colors.indigo
                                      : Colors.grey,
                                  width: 4.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                              bottom: BorderSide(
                                  color: (steps >= 2)
                                      ? Colors.indigo
                                      : Colors.grey,
                                  width: 4.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                              bottom: BorderSide(
                                  color: (steps >= 3)
                                      ? Colors.indigo
                                      : Colors.grey,
                                  width: 4.0),
                            )),
                      ),
                    ),
                  ],
                ),
                if (steps == 0) _BuildFirstStep(),
                if (steps == 1)
                  Expanded(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10),
                    child: _BuildSecondStep(),
                  )),
                if (steps == 2)
                  Expanded(
                      child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10),
                    child: _BuildThirdStep(),
                  )),
                if (steps == 3) _BuildLastStep(),
                Simpleloadingbutton(
                    steps: _nextStep,
                    SenseiSelected: SenseiSelected,
                    buttonContent:
                        (steps < 3) ? 'Continuer' : "Retour à l'accueil")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _BuildLastStep() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
        child: Image.asset(
          'assets/images/message_sent.png',
          height: 200,
        ),
      ),
      const Text(
        'Demande envoyée !',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      const Text('Nous vous répondrons dans un délai de 24h'),
    ]);
  }

  Widget _BuildThirdStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Infos du club',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: clubDataformkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: clubNameKey,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.groups,
                    color: indigoClassique,
                  ),
                  hintText: 'Benito Club',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text(
                    'Nom du club',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Votre nom est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: clubAddressKey,
                keyboardType: TextInputType.streetAddress,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: indigoClassique,
                  ),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text('Adresse',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _BuildSecondStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Infos personnelles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: personalDataformKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: firstNameKey,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.person,
                    color: indigoClassique,
                  ),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text(
                    'Nom',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Votre nom est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: lastNameKey,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.person,
                    color: indigoClassique,
                  ),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text(
                    'Prénoms',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
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
                controller: mailKey,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: indigoClassique,
                  ),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text('Email',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
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
              DropdownMenu(
                controller: martialArtTypeKey ,
                initialSelection: _preSelectedMartialArt,
                menuStyle: MenuStyle(
                  shape: WidgetStateProperty.resolveWith(
                      (states) => getBorderShape(states)),
                ),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                label: const Text('Discipline',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                width: MediaQuery.of(context).size.width / 1.1,
                leadingIcon: Icon(
                  Icons.sports_martial_arts,
                  color: indigoClassique,
                ),
                dropdownMenuEntries: const <DropdownMenuEntry>[
                  DropdownMenuEntry(value: "Karaté", label: 'Karaté'),
                  DropdownMenuEntry(value: "Judo", label: 'Judo'),
                  DropdownMenuEntry(value: "Kung-fu", label: 'Kung-fu'),
                  DropdownMenuEntry(value: "Taekwondo", label: 'Taekwondo'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: licenseKey,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.card_membership,
                    color: indigoClassique,
                  ),
                  hintText: 'ABCD57',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  label: const Text('N° license',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0.5)),
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
              DropdownMenu(
                controller: gradeKey,
                initialSelection: _preSelectedGrade,
                menuStyle: MenuStyle(
                  shape: WidgetStateProperty.resolveWith(
                      (states) => getBorderShape(states)),
                ),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                label: const Text('Grade',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                width: MediaQuery.of(context).size.width / 1.1,
                leadingIcon: Icon(
                  Icons.emoji_events,
                  color: indigoClassique,
                ),
                dropdownMenuEntries: const <DropdownMenuEntry>[
                  DropdownMenuEntry(value: "1", label: '1 Dan'),
                  DropdownMenuEntry(value: "2", label: '2 Dan'),
                  DropdownMenuEntry(value: "3", label: '3 Dan'),
                  DropdownMenuEntry(value: "4", label: '4 Dan'),
                  DropdownMenuEntry(value: "5", label: '5 Dan'),
                  DropdownMenuEntry(value: "6", label: '6 Dan'),
                  DropdownMenuEntry(value: "7", label: '7 Dan'),
                  DropdownMenuEntry(value: "8", label: '8 Dan'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _BuildFirstStep() {
    return Column(
      children: [
        const Text(
          'Choix du compte',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  SenseiSelected = true;
                  print(SenseiSelected);
                });
              },
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 1),
                      gradient: (SenseiSelected)
                          ? const LinearGradient(
                              colors: [Colors.indigo, Colors.blue])
                          : null,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 5),
                        child: Image.asset(
                          'assets/images/karate_man.png',
                          height: 200,
                        ),
                      ),
                      Text(
                        'Sensei',
                        style: TextStyle(
                            color: (SenseiSelected)
                                ? Colors.white
                                : indigoClassique,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ]),
                  ),
                  if (SenseiSelected)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Checkbox(
                        activeColor: Colors.white,
                        splashRadius: 15,
                        checkColor: Colors.green,
                        overlayColor: WidgetStateProperty.resolveWith(
                            (states) => getWhiteColor(states)),
                        tristate: true,
                        value: true,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          setState(() {
                            print('object');
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  SenseiSelected = false;
                  print(SenseiSelected);
                });
              },
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 1),
                      gradient: (!SenseiSelected)
                          ? const LinearGradient(
                              colors: [Colors.indigo, Colors.blue])
                          : null,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 5),
                        child: Image.asset(
                          'assets/images/karate_boy.png',
                          height: 200,
                        ),
                      ),
                      Text(
                        'Student',
                        style: TextStyle(
                            color: (!SenseiSelected)
                                ? Colors.white
                                : indigoClassique,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ]),
                  ),
                  if (!SenseiSelected)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Checkbox(
                        activeColor: Colors.white,
                        splashRadius: 15,
                        checkColor: Colors.green,
                        overlayColor: WidgetStateProperty.resolveWith(
                            (states) => getWhiteColor(states)),
                        tristate: true,
                        value: true,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          setState(() {
                            print('object');
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
