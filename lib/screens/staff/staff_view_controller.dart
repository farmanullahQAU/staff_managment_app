import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:staff_managment_dashboard/constants/constants.dart';
import 'package:staff_managment_dashboard/db_services/firestore.dart';

import '../../models/user_model.dart';

class StaffViewController extends GetxController {

  RxInt? sortIndex;

  final isAscending=false.obs;




  
  List<UserModel> get staff => _staff;

  set staff(List<UserModel> users) => _staff = users.obs;

//.....................search getter setter ........................



final RxString _serachedKeyWord="".obs;
String get serachedKeyWord=>_serachedKeyWord.value;
set serachedKeyWord(String value)=>_serachedKeyWord.value=value;
TextEditingController searchFieldTextEditingController=TextEditingController();

    final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool val) => _isSearching.value = val;

  List<UserModel> get getSearchedEntries=>

     staff.where((user) => user.firstName.contains(serachedKeyWord)||
    user.email.contains(serachedKeyWord)||
    user.position.contains(serachedKeyWord)||
    
    user.email.contains(serachedKeyWord)||
    user.office.officeAddress
    .contains(serachedKeyWord)
    ).toList();
  

  //..........................................................

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

    _staff = usersList;
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
  ];

  String listName = "";

  //list to store final filtered entries
  List<UserModel> filtered = <UserModel>[].obs;


  @override
  void onInit() {
    _selectedEmploymentType = "".obs;
    _selectedStatus = "".obs;
    _selectedOffice = "".obs;
    _selectedDept = "".obs;
    _selectedTeam = "".obs;
    _selectedPosition = "".obs;
    _staff = <UserModel>[].obs;

    buildDropDownList();

    super.onInit();
  }


//list for dropdown value so it will be dynmic
//comming from backend

//.......................dropdown values lists variables......................
  RxList<String> employmentTypeList = <String>[].obs;

  List<String> teamList = <String>[].obs;

  RxList<String> positionsList = <String>[].obs;

  RxList<String> departmentsList = <String>[].obs;

  RxList<String> officeList = <String>[].obs;

  //.......................................end..............................

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

  filterByEmployeType() {
    final _list = staff
        .where((user) => user.employmentType == selectedEmploymentType)
        .toList();

      filtered.assignAll(_list);
    } 
  
  filterByStatus() {
    final _list = staff
        .where((user) => user.status.toString() == selectedStatus)
        .toList();

    
      filtered.assignAll(_list);
    } 
  
  filterByDeptt() {
    //each time when users change dropdown, set departmentList
    final _departmentList =
        staff.where((user) => user.office.department == selectedDept).toList();

   
      filtered.assignAll(_departmentList);
    } 
  

    filterByOffice() {
    final _officeList =
        staff.where((user) => user.office.officeAddress == selectedOffice).toList();

         filtered.assignAll(_officeList);

    
  }
    filterByPosition() {
    final _list =
        staff.where((user) => user.position == selectedPosition).toList();

         filtered.assignAll(_list);

    
  }
    filterByTeam() {
    final _list =
        staff.where((user) => user.office.team == selectedTeam).toList();

         filtered.assignAll(_list);

    
  }

  clearFields(){
  selectedStatus="";
      selectedEmploymentType="";
      selectedDept="";
      selectedOffice="";
      selectedTeam="";
      selectedPosition="";

  }


  void sort(int columnIndex, bool ascending) {
    //sir filtered data

isFilter==true?

 filtered.sort((user1,user2)=>ascending?user1.firstName.compareTo(user2.firstName):user2.firstName.compareTo(user1.firstName)):

 //sort available search data
isSearching==true?
getSearchedEntries.sort((user1,user2)=>ascending?user1.firstName.compareTo(user2.firstName):user2.firstName.compareTo(user1.firstName))

   :

   //sort all data
staff.sort((user1,user2)=>ascending?user1.firstName.compareTo(user2.firstName):user2.firstName.compareTo(user1.firstName));
  sortIndex=columnIndex.obs;
    isAscending.value=ascending;
       
 
    
  }

 
}
