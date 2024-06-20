import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/configs/routes.dart';

import '../constants/theme/colors.materialState.dart';
import 'Snackbars.dart';

class LoadingButton extends StatefulWidget {
  final Function onPressed;
  final String buttonContent;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoadingButton(
      {super.key,
      required this.onPressed,
      required this.buttonContent,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isSpinning = false;
  bool buttonState = false;


  void toggleLoading() {

    setState(() {
      if (widget.formKey.currentState!.validate()) {
        widget.formKey.currentState!.save();
        print(widget.emailController.text);
        print(widget.passwordController.text);

      buttonState = !buttonState;
      if (buttonState) {
        isSpinning = true;
        try{
          widget.onPressed(context, widget.emailController.text, widget.passwordController.text).then((_) {
            stopLoading();
          });
        } catch(e){
          ScaffoldMessenger.of(context).showSnackBar(returnErrorSnackbar(context, 'An Error has occured'));
          stopLoading();
        }

      }
      }
    });
  }

  void stopLoading() {
    setState(() {
      buttonState = !buttonState;
      isSpinning = !isSpinning;
    });
    Navigator.of(context).pushNamed(routeList.main);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.resolveWith((states) => getColor(states)),
          shape: WidgetStateProperty.resolveWith(
              (states) => getBorderShape(states)),
        ),
        onPressed: buttonState ? null : toggleLoading,
        child: Container(
            alignment: Alignment.center,
            color: Colors.indigo.shade700,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: (!isSpinning)
                ? Text(
                    widget.buttonContent,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.0,
                    ))));
  }
}
