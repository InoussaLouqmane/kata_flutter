

  import 'dart:ui';

import 'package:flutter/material.dart';

Color indigoClassique = Colors.indigo.shade700;

Color getColor(Set<WidgetState> states) {
  return indigoClassique;
}

  Color getRedColor(Set<WidgetState> states) {
    return Colors.red;
  }

  Color getWhiteColor(Set<WidgetState> states) {
    return Colors.white;
  }

OutlinedBorder getBorderShape(Set<WidgetState> states){
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(6));
}

