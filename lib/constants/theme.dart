import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color_pallete.dart';
import 'constants.dart';

class AppTheme{



  static final customTheme=ThemeData(

    listTileTheme: ListTileThemeData(selectedTileColor: Color.fromARGB(255, 126, 233, 247)),

inputDecorationTheme: InputDecorationTheme(


  prefixIconColor: Colors.cyan



),
    
    navigationRailTheme: NavigationRailThemeData(

      
      selectedIconTheme:IconThemeData(
        
        
        
        
        color: ColorPalette.railSelectedIconColor),

        //custom theme for rail unselected icon
            
      unselectedIconTheme:IconThemeData(
        
        
        
        
        color: ColorPalette.railUnselectedIconColor),
      
      backgroundColor:ColorPalette. railColorGrey
    
    
    ),

    

    // iconTheme: IconThemeData(color: orangeDarkPrimaryColor),

    textTheme:TextTheme(titleSmall: TextStyle(color: Color.fromARGB(255, 209, 14, 46))) ,

      
     
      );



    
}