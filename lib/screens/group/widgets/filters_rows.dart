import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:staff_managment_dashboard/components/mybutton.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import '../../../components/dropdown_form_field.dart';
import '../../../models/user_model.dart';
import '../groups_view_controller.dart';

class FiltersRow extends StatelessWidget {
  final _allstaffsController = Get.find<StaffViewController>();
  FiltersRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

     Text(_allstaffsController.officeList.length.toString()),
          TextButton(
          
          onPressed: (){
            _allstaffsController.isFilter=true;
            _allstaffsController.getFilter();

 

            
          },
          child: Text("kkk")),
        Obx(()=>
        
        _allstaffsController.selectedStatus==""?

        TextButton(
          
          onPressed: (){
            _allstaffsController.getFilter();
          },
          child: Text("kkk")):
        
        Text(_allstaffsController.selectedStatus.toString())),
        ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 3,
              child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  rowSpacing: 10,
                  columnSpacing: 10,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  rowPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  columnPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [

                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: DropDownField(

                        value: _allstaffsController.selectedStatus,
                          items: const [false, true],
                          hintText: "status",
                          onChanged: (bool status) {

                            _allstaffsController.isFilter = true;

                            _allstaffsController.selectedStatus = status.toString();

                          }),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: 
                        DropDownField(
                          value: _allstaffsController.selectedEmploymentType,
                            items: _allstaffsController.employmentTypeList,
                            hintText: employmentType.capitalizeFirst!,
                            onChanged: (employmentType) {
                              _allstaffsController.isFilter = true;
                      
                      //set set current employmentype 
                      
                      _allstaffsController.selectedEmploymentType=employmentType;
                      
                            }),
                    ),


                       ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: DropDownField(
                          items: _allstaffsController.departmentsList,
                          hintText: department.capitalizeFirst!,
                          onChanged: (String department) {

         _allstaffsController.isFilter = true;

//set set current office 

_allstaffsController.selectedDept=department;
                          }),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: DropDownField(
                        value: _allstaffsController.selectedOffice,
                          items: _allstaffsController.officeList,
                          hintText: office.capitalizeFirst!,
                          onChanged: (String office) {
         _allstaffsController.isFilter = true;

//set set current office 

_allstaffsController.selectedOffice=office;

                          }),
                    ),


                        ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: DropDownField(
                          items: _allstaffsController.teamList,
                          hintText: team.capitalizeFirst!,
                          onChanged: (String team) {
         _allstaffsController.isFilter = true;

//set set current office 

_allstaffsController.selectedTeam=team;

                          }),
                    ),


                        ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: DropDownField(
                               value: _allstaffsController.selectedTeam,
                          items: _allstaffsController.positionsList,
                          hintText: position.capitalizeFirst!,
                          onChanged: (String position) {
         _allstaffsController.isFilter = true;

//set set current office 

_allstaffsController.selectedPosition=position;

                          }),
                    )
                  ]),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 2,
              child: TextButton(
                child: Text("clear filter"),
                onPressed: () async {
       

                              _allstaffsController.selectedEmploymentType="";


                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
