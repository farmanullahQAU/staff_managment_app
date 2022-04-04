import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';
import 'package:staff_managment_dashboard/db_services/firestore.dart';
import 'package:staff_managment_dashboard/models/user_model.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import '../group/widgets/filters_rows.dart';

class StaffView extends StatelessWidget {
  final _staffViewController = Get.find<StaffViewController>();

   StaffView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
             FiltersRow(),
          Obx(



            
            () => _staffViewController.isSearching == true&&_staffViewController.serachedKeyWord.isNotEmpty
                ? _staffViewController.getSearchedEntries.isEmpty
                    ? const Center(
                        child: Center(child: Text("no data available")),

                        //there is no need of rewring the datatable so we will minimize the code soon later
                      )
                    : SingleChildScrollView(
                        child: Obx(
                          () => PaginatedDataTable(
                            header: Obx(() => Text(_staffViewController
                                .getSearchedEntries.length
                                .toString())),
                            rowsPerPage:
                                _staffViewController.getSearchedEntries.length,
                            columns: [
                           //show nothing for image coulum cell header
                              DataColumn(label: Container()),

                              DataColumn(label: Text(firstName.capitalizeFirst!)),
                              DataColumn(label: Text(lastName.capitalizeFirst!)),
                              DataColumn(label: Text(status.capitalizeFirst!)),
                              DataColumn(
                                  label: Text(employmentType.capitalizeFirst!)),
                              DataColumn(label: Text(email.capitalizeFirst!)),
                              DataColumn(label: Text(office.capitalizeFirst!)),
                              DataColumn(label: Text(department.capitalizeFirst!)),
                              DataColumn(label: Text(team.capitalizeFirst!)),
                              DataColumn(label: Text(position.capitalizeFirst!)),
                            ],
                            source: _DataSource(
                                context, _staffViewController.getSearchedEntries),
                          ),
                        ),
                      )
                : _staffViewController.isFilter == true &&
                        _staffViewController.filtered.isEmpty
                    ? const Center(
                        child: Text("No data found"),
                      )
                    : _staffViewController.isFilter == true
                        ? SingleChildScrollView(
                            child: Obx(
                              () => PaginatedDataTable(
                                header: Obx(() => Text(_staffViewController
                                    .filtered.length
                                    .toString())),
                                rowsPerPage: _staffViewController.filtered.length,
                                columns: [
                              DataColumn(label: Container()),
                                  
                                  DataColumn(
                                      label: Text(firstName.capitalizeFirst!)),
                                  DataColumn(
                                      label: Text(lastName.capitalizeFirst!)),
                                  DataColumn(label: Text(status.capitalizeFirst!)),
                                  DataColumn(
                                      label: Text(employmentType.capitalizeFirst!)),
                                  DataColumn(label: Text(email.capitalizeFirst!)),
                                  DataColumn(label: Text(office.capitalizeFirst!)),
                                  DataColumn(
                                      label: Text(department.capitalizeFirst!)),
                                  DataColumn(label: Text(team.capitalizeFirst!)),
                                  DataColumn(
                                      label: Text(position.capitalizeFirst!)),
                                ],
                                source: _DataSource(
                                    context, _staffViewController.filtered),
                              ),
                            ),
                          )
                        : FutureBuilder(
                            future: FirestoreServices.getStaffsMembers(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<UserModel>> users) {
                              if (users.hasData) {
                                final List<UserModel> usersList = users.data!;

                                _staffViewController.initUsersList(usersList);

                                return SingleChildScrollView(
                                  child: PaginatedDataTable(
                                    header: Text('Header Text'),
                                    rowsPerPage: users.data!.length > 8
                                        ? 7
                                        : users.data!.length,
                                    columns: [
                                         DataColumn(label:Container()),
                                      DataColumn(
                                          label: Text(firstName.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(lastName.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(status.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(
                                              employmentType.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(email.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(office.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(department.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(team.capitalizeFirst!)),
                                      DataColumn(
                                          label: Text(position.capitalizeFirst!)),
                                    ],
                                    source: _DataSource(context, usersList),
                                  ),
                                );
                              }
                              if (!users.hasData) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return Container(
                                  width: 300,
                                  height: 100,
                                  color: Colors.red,
                                  child: const Text("Something went wrong"));
                            },
                          ),
          ),
        ],
      ),

// FirestoreQueryBuilder<UserModel>(
//     query: FirestoreServices().moviesCollection,
//   builder: (context, snapshot, _) {

//     return ListView.builder(

//       itemCount: snapshot.docs.length,

//       itemBuilder: (context, index) {
//         // if we reached the end of the currently obtained items, we try to
//         // obtain more items
//         if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
//           // Tell FirestoreQueryBuilder to try to obtain more items.
//           // It is safe to call this function from within the build method.
//           snapshot.fetchMore();
//         }

//         final user = snapshot.docs[index].data();

//         return Container(
//           padding: const EdgeInsets.all(8),
//           color: Colors.teal[100],
//           child:  Text("User name "),
//         );
//       });
//   },
// )

//       FirestoreListView<UserModel>(
//         loadingBuilder: (context) => CircularProgressIndicator(),
//   errorBuilder: (context, error, stackTrace) => Text(stackTrace.toString()),

//         shrinkWrap: true,
//   query: FirestoreServices().moviesCollection,
//   itemBuilder: (context, snapshot) {
// print("dkkdkdkdkdkdkkddkkdkdkdkdkdkkd");
//     print(snapshot.data());
//     // Data is now typed!
//     // UserModel user = snapshot.data();

//     return Center(child: Text(snapshot.data().firstName));
//   },
// )

      // ListView(

      //   shrinkWrap: true,
      //   padding: const EdgeInsets.all(16),
      //   children: [
      //     PaginatedDataTable(

      //       header: Text('Header Text'),
      //       rowsPerPage: 3,
      //       columns: [
      //         DataColumn(label: Text(firstName.capitalizeFirst!)),
      //         DataColumn(label: Text(lastName.capitalizeFirst!)),
      //         DataColumn(label: Text(status.capitalizeFirst!)),
      //         DataColumn(label: Text(employmentType.capitalizeFirst!)),
      //               DataColumn(label: Text(email.capitalizeFirst!)),
      //         DataColumn(label: Text(office.capitalizeFirst!)),
      //         DataColumn(label: Text(department.capitalizeFirst!)),
      //         DataColumn(label: Text(team.capitalizeFirst!)),
      //         DataColumn(label: Text(position.capitalizeFirst!)),

      //       ],
      //       source: _DataSource(context),
      //     ),
      //   ],
      // ),
    );
  }
}

class _DataSource extends DataTableSource {
  List<UserModel>? snapshot;

  final _controller = Get.find<StaffViewController>();

  _DataSource(this.context, this.snapshot);

  final BuildContext? context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= snapshot!.length) return null;
    final user = snapshot![index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected ?? false,
      onSelectChanged: (value) {
        if (user.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          user.selected = value;
          notifyListeners();
        }
      },
      cells: [

        DataCell(  CircleAvatar(
              backgroundImage
              
              :
              
              user.imageUrl!=null? NetworkImage(user.imageUrl!):Image.asset("images/mercury.png").image
            ),),
        DataCell(Text(user.firstName)),
        DataCell(Text(user.lastName?.capitalizeFirst ?? "")),
        DataCell(Text(user.status == true ? "Active" : "Inactive")),
        DataCell(Text(user.employmentType.capitalizeFirst!)),
        DataCell(Text(user.email)),
        DataCell(Text(user.office.officeAddress.capitalizeFirst!)),
        DataCell(Text(user.office.department.capitalizeFirst!)),
        DataCell(Text(user.office.team.capitalizeFirst!)),
        DataCell(Text(user.position.capitalizeFirst!),
            showEditIcon: true, placeholder: true),
      ],
    );
  }

  @override
  int get rowCount => snapshot!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
