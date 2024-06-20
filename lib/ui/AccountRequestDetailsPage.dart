import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/SimpleLoadingButton.dart';

class AccountRequestDetailsPage extends StatefulWidget {
  const AccountRequestDetailsPage({super.key});

  @override
  State<AccountRequestDetailsPage> createState() =>
      _AccountRequestDetailsPageState();
}

class _AccountRequestDetailsPageState extends State<AccountRequestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 243, 245, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(242, 243, 245, 1),
          title: const Text(
            'Détails de la demande de création de compte',
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //personal information
              Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(238, 245, 254, 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Color.fromRGBO(81, 143, 246, 1),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Informations personnelles',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),

                  //entire name
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Nom complet',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Arsène Awounou',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //mail address
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Adresse mail',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'arsenelawson@gmail.com',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //phone
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Téléphone',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Non défini',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //Genre
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Genre',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Non défini',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //discipline
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Discipline',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Judo',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  // grade
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Grade',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Ceinture noire + 1 Dan',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  // licenseID
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Numéro de license',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'ABCDF5',
                        ),
                      ],
                    ),
                  ]),



                ],
              ),
            ),

              //club information
              Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(238, 245, 254, 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Icon(
                            Icons.groups,
                            color: Color.fromRGBO(81, 143, 246, 1),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Informations du Club',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),

                  //club name
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Nom du club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Benito Karaté Club',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  //Nom du propriétaire
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Nom du propriétaire',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Non défini',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  //club mail address
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Adresse mail du club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'arsenelawson@gmail.com',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  //phone du Club
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Téléphone du club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Non défini',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  //Adresse du club
                  const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Adresse du Club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Non défini',
                        ),
                      ],
                    ),
                  ]),



                ],
              ),
            ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Simpleloadingbutton(SenseiSelected: true, buttonContent: 'Rejeter', steps: (){})),
                    SizedBox(width: 20,),
                    Expanded(child: Simpleloadingbutton(SenseiSelected: true, buttonContent: 'Valider', steps: (){}))


                  ],
                ),
              )

            ],
          ),
        ));
  }
}
