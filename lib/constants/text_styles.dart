import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';




class StyledText {
  static TextStyle get listViewText1 => GoogleFonts.aldrich();
  static TextStyle get  actorFontStyle=> GoogleFonts.oswald();

  static TextStyle get titleBolds =>
      listViewText1.copyWith(fontWeight: FontWeight.bold);
        static TextStyle get ptSans =>GoogleFonts.ptSans();
        static TextStyle get bodyLarge => Theme.of(Get.context!).textTheme.bodyLarge!;

        static TextStyle get titleSmall => Theme.of(Get.context!).textTheme.titleSmall!;
        static TextStyle get titleSmallGrey => Theme.of(Get.context!).textTheme.titleSmall!.copyWith(color: Colors.grey);
        static TextStyle get titleLarge => Theme.of(Get.context!).textTheme.titleLarge!;

        

       
}
