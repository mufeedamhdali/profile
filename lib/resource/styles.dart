import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mufeeda/resource/colors.dart';

class TxtStyle {
  var neonText =
      GoogleFonts.orbitron(color: AppColors().neonColor, fontSize: 14);

  boldBlack(context) =>
       TextStyle(color: AppColors().blackColor, fontWeight: FontWeight.bold);

  boldWhite(context) =>
       TextStyle(color: AppColors().whiteColor, fontWeight: FontWeight.bold);
}
