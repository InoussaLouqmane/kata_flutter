import 'package:flutter/material.dart';

import '../constants/theme/colors.materialState.dart';
import 'Snackbars.dart';

class Simpleloadingbutton extends StatefulWidget {
  final bool SenseiSelected;
  final String buttonContent;
  final Function steps;

   Simpleloadingbutton({
    super.key,
    required this.SenseiSelected,
    required this.buttonContent, required this.steps,
    });

  @override
  State<Simpleloadingbutton> createState() => _SimpleloadingbuttonState();
}

class _SimpleloadingbuttonState extends State<Simpleloadingbutton> {
  bool isSpinning = false;
  bool buttonState = false;

  void toggleLoading() {
    setState(() {
      buttonState = !buttonState;
      if (buttonState) {
        isSpinning = true;

        Future.delayed(const Duration(seconds: 2), (){
          stopLoading();
          widget.steps();
        });
      }
    });
  }

  void stopLoading() {
    setState(() {
      buttonState = !buttonState;
      isSpinning = !isSpinning;
    });
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
