import 'package:get/state_manager.dart';

import '../../models/user_model.dart';

class StaffViewController extends GetxController{



   final List<UserModel> _staff = [
    UserModel(
      imageUrl: "https://picsum.photos/200/300?random=1",
        position: "sale manager",

        selected: false,
        firstName: "ali",
        lastName: "ahmad",

        status: true,
        employmentType: "internal",
        email: "ali@gmail.com",
        office: Office(
            officeAddress: "Munchen",
            department: "marketing & sale",
            team: "sale")),
              UserModel(
      imageUrl: "https://picsum.photos/200/300?random=2",

        selected: false,

        position: "sale manager",
        firstName: "salman",
        lastName: "tasir",
        status: true,
        employmentType: "internal",
        email: "salman@gmail.com",
        office: Office(
            officeAddress: "Munchen",
            department: "marketing & sale",
            team: "sale")),
              UserModel(
      imageUrl: "https://picsum.photos/200/300?random=3",

        selected: false,

        position: "head of customer",
        firstName: "chris",
        status: true,
        employmentType: "internal",
        email: "chris@gmail.com",
        office: Office(
            officeAddress: "Islamabad",
            department: "it",
            team: "sale")),
  ];

  List<UserModel> get staff=>_staff;
}