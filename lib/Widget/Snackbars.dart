import 'package:flutter/material.dart';

SnackBar returnErrorSnackbar(BuildContext context, String message) {
  return SnackBar(
    showCloseIcon: true,
    content: Text(message),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );
}

SnackBar returnSuccessSnackbar(BuildContext context, String message) {
  return SnackBar(
    showCloseIcon: true,
    content: Text(message),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );
}
