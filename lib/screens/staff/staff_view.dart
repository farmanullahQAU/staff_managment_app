
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';



class StaffView extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
   
      body: ListView(

        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
          
            header: Text('Header Text'),
            rowsPerPage: 3,
            columns: [
              DataColumn(label: Text(firstName.capitalizeFirst!)),
              DataColumn(label: Text(lastName.capitalizeFirst!)),
              DataColumn(label: Text(status.capitalizeFirst!)),
              DataColumn(label: Text(employmentType.capitalizeFirst!)),
                    DataColumn(label: Text(email.capitalizeFirst!)),
              DataColumn(label: Text(office.capitalizeFirst!)),
              DataColumn(label: Text(department.capitalizeFirst!)),
              DataColumn(label: Text(team.capitalizeFirst!)),
              DataColumn(label: Text(position.capitalizeFirst!)),

            ],
            source: _DataSource(context),
          ),
        ],
      ),
    );
  }
}






class _DataSource extends DataTableSource {
  final _controller=Get.find<StaffViewController>();

  _DataSource(this.context) ;

  final BuildContext? context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _controller.staff.length) return null;
    final user = _controller.staff[index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected??false,
      onSelectChanged: (value) {
        if (user.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          user.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(
          
          
          
          Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user.imageUrl??""),),

       eightWidthSizedBox,
            Text(user.firstName),
          ],
        )),
        DataCell(Text(user.lastName??"..")),
             DataCell(Text(user.status==true?"Active":"Inactive")),
        DataCell(Text(user.employmentType)),
        DataCell(Text(user.email)),
        DataCell(Text(user.office.officeAddress)),
        DataCell(Text(user.office.department)),

        DataCell(Text(user.office.team)),
        DataCell(Text(user.position),showEditIcon: true,placeholder: true),


      ],
    );
  }

  @override
  int get rowCount => _controller.staff.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}





