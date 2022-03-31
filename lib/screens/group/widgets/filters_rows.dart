import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:staff_managment_dashboard/components/mybutton.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';

import '../../../components/dropdown_form_field.dart';
import '../groups_view_controller.dart';

class FiltersRow extends StatelessWidget {
  final _controller=Get.find<NavigationRailController>();
   FiltersRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(


           layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
      children: [

ResponsiveRowColumnItem(

  rowFlex: 3,
  child:   ResponsiveRowColumn(
      
                  rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  rowSpacing: 10,
                  columnSpacing: 10,
      
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  rowPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  columnPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          
             layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
      
          
          children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
      
          child: DropDownField(items: [1,2], hintText: "status", onChanged: (value){
          
          
          
          }),
        ),
        
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: DropDownField(items:_controller.employmentTypeList, hintText: employmentType.capitalizeFirst!, onChanged: (value){
          
          
          
          }),
        ),
      
        ResponsiveRowColumnItem(
          rowFlex: 1,
      
          child: DropDownField(items: _controller.departmentsList, hintText: department.capitalizeFirst!, onChanged: (value){
          
          
          
          }),
        )
        
        
        ]),
),
ResponsiveRowColumnItem(
  
  
  rowFlex: 2,
  
  child:TextButton(child: Text("clear filter"),onPressed: (){},),)

      ],
    );
  }
}