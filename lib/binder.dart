
import 'package:get/get.dart';
import 'package:staff_managment_dashboard/controllers/menu_controller.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import 'screens/group/groups_view_controller.dart';


class Binder extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<StaffViewController>(() => StaffViewController());

     Get.put(MenuController());

     Get.put(NavigationRailController());







     

     


  }
}
