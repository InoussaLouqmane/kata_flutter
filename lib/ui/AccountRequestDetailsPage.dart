import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/Snackbars.dart';
import 'package:kata_mobile_frontui/models/AccountRequestModel.dart';
import 'package:kata_mobile_frontui/services/AccountRequestService.dart';

import '../constants/theme/colors.materialState.dart';

class AccountRequestDetailsPage extends StatefulWidget {
  const AccountRequestDetailsPage({super.key});

  @override
  State<AccountRequestDetailsPage> createState() =>
      _AccountRequestDetailsPageState();
}

class _AccountRequestDetailsPageState extends State<AccountRequestDetailsPage> {

  String userName = '-';
  bool validated = false ;

  @override
  Widget build(BuildContext context) {
    AccountRequestModel? args = ModalRoute.of(context)!.settings.arguments as AccountRequestModel;
    AccountRequestService accountRequestService = AccountRequestService(AccountRequest: args);


    if (args != null){
       userName = "${args?.firstName} + ${args?.lastName}";
       validated =(args?.status=="Approuvé") ? true : false;
    }
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

              if(validated) Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Text('Validé', style: TextStyle(color: Colors.white),),
              ),

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
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Nom complet',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                         userName,
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //mail address
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Adresse mail',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args?.email ?? '-',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //phone
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Téléphone',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args?.phone ?? '-',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //Genre
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Genre',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Pas encore branché',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  //discipline
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Discipline',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Pas encoré branché' ,
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),
                  // grade
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Grade',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Ceinture noire + ${args?.grade ?? '1'}Dan',
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 5,),
                  const Divider(),

                  // licenseID
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Numéro de license',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args?.licenseId ?? '-',
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
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Nom du club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args?.clubName ?? '-',
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
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Adresse mail du club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          args?.clubAddress ?? '-',
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
                   Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        const Text(
                          'Adresse du Club',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                            args?.clubAddress ?? '-',
                        ),
                      ],
                    ),
                  ]),



                ],
              ),
            ),

              if (!validated) Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(child:
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        WidgetStateProperty.resolveWith((states) => getRedColor(states)),
                        shape: WidgetStateProperty.resolveWith(
                                (states) => getBorderShape(states)),
                      ),
                      onPressed: () async {
                        var status = await accountRequestService.RejectRequest();
                        if(status == 200){
                          ScaffoldMessenger.of(context).showSnackBar(returnSuccessSnackbar(context, 'Rejeté avec succès'));
                          setState(() {
                            validated = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(returnErrorSnackbar(context, 'An error occured'));
                        }
                        setState(() {
                          validated = true;
                        });
                      },
                      child: const Text(
                        'Rejeter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    ),
                    const SizedBox(width: 20,),
                    Expanded(child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        WidgetStateProperty.resolveWith((states) => getColor(states)),
                        shape: WidgetStateProperty.resolveWith(
                                (states) => getBorderShape(states)),
                      ),
                      onPressed: () async {
                          var status = await accountRequestService.ValidateRequest();
                          if(status == 200){
                            ScaffoldMessenger.of(context).showSnackBar(returnSuccessSnackbar(context, 'Ajouté avec succès'));
                            setState(() {
                              validated = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(returnErrorSnackbar(context, 'An error occured'));
                          }


                      },
                      child: const Text(
                        'Valider',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))


                  ],
                ),
              )

            ],
          ),
        ));
  }
}
