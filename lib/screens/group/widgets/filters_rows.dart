import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
                  rowPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  columnPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                         DropDownField(
                            value: _allstaffsController.selectedStatus=="true"?true:false,
                            items: const [false, true],
                            hintText: "status",
                            onChanged: (bool status) {
                              _allstaffsController.isFilter = true;
                      
                           
                      
                              _allstaffsController.selectedStatus =
                                  status.toString();

                            _allstaffsController.      filterByStatus();
                          
                            }),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                        DropDownField(
                            value: _allstaffsController.selectedEmploymentType,
                            items: _allstaffsController.employmentTypeList,
                            hintText: employmentType.capitalizeFirst!,
                            onChanged: (empType) {
                      
                      
                      
                              _allstaffsController.isFilter = true;
                      
                                          
                      
                              _allstaffsController.selectedEmploymentType =
                                  empType;
                      
                                  _allstaffsController.filterByEmployeType();
                      
                             
                            }),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                        DropDownField(
                          value: _allstaffsController.selectedDept,
                            items: _allstaffsController.departmentsList,
                            hintText: department.capitalizeFirst!,
                            onChanged: (String deptt) {
                               _allstaffsController.isFilter = true;
                      
                                          
                      
                              _allstaffsController.selectedDept =
                                  deptt;
                              _allstaffsController.filterByDeptt();
                             
                            }),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                        DropDownField(
                            value: _allstaffsController.selectedOffice,
                            items: _allstaffsController.officeList,
                            hintText: office.capitalizeFirst!,
                            onChanged: (String office) {
                              _allstaffsController.isFilter = true;
                      
                      //set set current office
                      
                              _allstaffsController.selectedOffice = office;
                      
                              _allstaffsController.filterByOffice();
                            }),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                         DropDownField(
                            value: _allstaffsController.selectedTeam,
                            items: _allstaffsController.teamList,
                            hintText: team.capitalizeFirst!,
                            onChanged: (String team) {
                              _allstaffsController.isFilter = true;
                      
                      //set set current office
                      
                              _allstaffsController.selectedTeam = team;
                              _allstaffsController.filterByTeam();
                            }),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Obx(()=>
                        DropDownField(
                            value: _allstaffsController.selectedPosition,
                            items: _allstaffsController.positionsList,
                            hintText: position.capitalizeFirst!,
                            onChanged: (String position) {
                              _allstaffsController.isFilter = true;
                      
                      //set set current office
                      
                              _allstaffsController.selectedPosition = position;
                              _allstaffsController.filterByPosition();

                            }),
                      ),
                    )
                  ]),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 2,
              child: Obx(()=>
              _allstaffsController.isFilter==true?
                TextButton(
                  child: Text("clear filter"),
                  onPressed: () async {
                    _allstaffsController.clearFields();
                    _allstaffsController.isFilter=false;
              
                  },
                ):Container()
              ),
            )
          ],
        ),
      ],
    );
  }
}
