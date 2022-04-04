import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:staff_managment_dashboard/screens/login/login_view.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import '../home/holiday/holiday_view.dart';
import '../home/home_view.dart';
import '../staff/staff_view.dart';

class NavigationRailController extends GetxController{

    //to control menu for mobile and web

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  final _currentIndex=0.obs;
  int get currentIndex=>_currentIndex.value;

  set currentIndex(int index)=>_currentIndex.value=index;
final List<Widget> _tabs=[
const HomeView(),

  StaffView(),

  HolidayView(),

  const Center(child: Text("OTHER VIEW"),),

  const Center(child: Text("GRAPH VIEW"),),

  const Center(child: Text("CHART VIEW"),),

  const Center(child: Text("XYZ"),),



  
];

List<Widget> get tabs=>_tabs;
  @override
  void onInit() {


    super.onInit();
  }
}