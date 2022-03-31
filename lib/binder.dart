
import 'package:get/get.dart';
import 'package:staff_managment_dashboard/controllers/menu_controller.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import 'screens/add_new/add_parameters_controller.dart';
import 'screens/group/groups_view_controller.dart';


class Binder extends Bindings {
  @override
  void dependencies() {
     Get.put(MenuController());

     Get.put(NavigationRailController());

     Get.lazyPut<StaffViewController>(() => StaffViewController());

     Get.put(AddParametersController());

     

     

    // Get.lazyPut<LibraryViewController>(() => LibraryViewController());
    // Get.lazyPut(() => VideosPlayerController());
    // Get.lazyPut(() => CameraRollViewController());

    // Get.lazyPut(() => ImageFilterViewController());
  }
}
