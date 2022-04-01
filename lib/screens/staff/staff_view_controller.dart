import 'package:get/state_manager.dart';

import '../../models/user_model.dart';

class StaffViewController extends GetxController {
  final selectedStatus = false.obs;

  final _isFilter = false.obs;

  bool get isFilter => _isFilter.value;

  set isFilter(bool val) => _isFilter.value = val;

  initUsersList(List<UserModel> usersList) {
    staff.clear();

    _staff = usersList.obs;
  }

  late List<UserModel> _staff = <UserModel>[
    // UserModel(
    //   imageUrl: "https://picsum.photos/200/300?random=1",
    //     position: "sale manager",

    //     selected: false,>
    //     firstName: "ali",
    //     lastName: "ahmad",

    //     status: true,
    //     employmentType: "internal",
    //     email: "ali@gmail.com",
    //     office: Office(
    //         officeAddress: "Munchen",
    //         department: "marketing & sale",
    //         team: "sale")),
  ].obs;

  List<UserModel> get staff => _staff;

  List<UserModel> get getFilterUsers =>
      staff.where((user) => (user.status == selectedStatus.value)).toList();
}
