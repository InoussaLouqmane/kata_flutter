

  import 'dart:ui';

import 'package:flutter/material.dart';

Color indigoClassique = Colors.indigo.shade700;

Color getColor(Set<MaterialState> states) {
  return indigoClassique;
}

OutlinedBorder getBorderShape(Set<MaterialState> states){
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(6));
}

