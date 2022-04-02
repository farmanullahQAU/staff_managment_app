import 'package:get/state_manager.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';
import 'package:staff_managment_dashboard/db_services/firestore.dart';

import '../../models/user_model.dart';

class StaffViewController extends GetxController {

  late final RxString _selectedStatus;

  String get selectedStatus => _selectedStatus.value;
  set selectedStatus(String value) => _selectedStatus.value = value;

  late final RxString _selectedPosition;

  String get selectedPosition => _selectedPosition.value;
  set selectedPosition(String value) => _selectedPosition.value = value;

  late final RxString _selectedOffice;

  String get selectedOffice => _selectedOffice.value;
  set selectedOffice(String value) => _selectedOffice.value = value;
  late final RxString _selectedDept;

  String get selectedDept => _selectedDept.value;
  set selectedDept(String value) => _selectedDept.value = value;

  late final RxString _selectedTeam;

  String get selectedTeam => _selectedTeam.value;
  set selectedTeam(String value) => _selectedTeam.value = value;

  late final RxString _selectedEmploymentType;
  String get selectedEmploymentType => _selectedEmploymentType.value;
//set when user select employment type from dropdown to filter staff mem
  set selectedEmploymentType(String? type) =>
      _selectedEmploymentType.value = type ?? "";

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

  @override
  void onInit() {
    _selectedEmploymentType = "".obs;
    _selectedStatus = "".obs;
    _selectedOffice = "".obs;
    _selectedDept = "".obs;
    _selectedTeam = "".obs;
    _selectedPosition = "".obs;

    buildDropDownList();

    super.onInit();
  }

  List<UserModel> getFilter() {
   final filtersKeywords= {
        "status": _selectedStatus.value,
        "office": _selectedOffice.value,
        "deptt": _selectedDept.value,
        "team": _selectedTeam.value,
        "position": _selectedPosition.value,
        "employetype": _selectedEmploymentType.value,
      };
    final Map<String, dynamic> vaddd = {};

    filtersKeywords.forEach((key, value) {
      if (value != "") {
        vaddd[key] = value;



      }
    });



    return staff
        .where((user) =>
            (



               ( vaddd['office'].toString() == user.office.officeAddress))
                
                
                &&(vaddd['deptt']==user.office.department)
                
                )
        .toList();
  }

  RxList<String> employmentTypeList = <String>[].obs;

  List<String> teamList = <String>[].obs;

  RxList<String> positionsList = <String>[].obs;

  RxList<String> departmentsList = <String>[].obs;

  RxList<String> officeList = <String>[].obs;

  buildDropDownList() async {

    //fetch dynamic data from firebase to build dropdown filed 
    final users = (await FirestoreServices.getStaffsMembers()).obs;

    for (var user in users) {
      officeList.add(user.office.officeAddress);
      employmentTypeList.add(user.employmentType);
      teamList.add(user.office.team);
      positionsList.add(user.position);
      departmentsList.add(user.office.department);
    }

    officeList = removeDuplicate(officeList).obs;
    employmentTypeList = removeDuplicate(employmentTypeList).obs;
    teamList = removeDuplicate(teamList).obs;
    positionsList = removeDuplicate(positionsList).obs;
    departmentsList = removeDuplicate(departmentsList).obs;
  }

  List<String> removeDuplicate(List<String> usersLIst) {
    return usersLIst.toSet().toList();
  }
}
