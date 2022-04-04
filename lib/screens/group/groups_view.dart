import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:staff_managment_dashboard/controllers/menu_controller.dart';
import 'package:staff_managment_dashboard/screens/group/widgets/top_row.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view.dart';

import '../../constants/constants.dart';
import 'groups_view_controller.dart';
import 'widgets/filters_rows.dart';
import 'widgets/notification_banner.dart';

class GropsHomeView extends StatelessWidget {
  final _controller = Get.find<NavigationRailController>();

  @override
  Widget build(BuildContext context) {
    return 
    
  ResponsiveWrapper.of(context).isLargerThan(MOBILE)
            ? _addDesktopView(context)  :
    
   _addMobileView(context);
  }

  _addMobileView(BuildContext context) {
    return Scaffold(


      drawer: Drawer(
       
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            Obx(()=>
              ListTile(
            
            
                selected: _controller.currentIndex==0,
                      leading:    const CircleAvatar(
                child: Icon(Icons.home),
              ),
                onTap: () {
                               _controller.currentIndex=0;
            
                  Navigator.pop(context);
                },
              ),
            ),
         Obx(()=>
            ListTile(
                selected: _controller.currentIndex==1,
         
            leading:    const CircleAvatar(
                child: Icon(Icons.group),
              ),
                onTap: () {
                  _controller.currentIndex=1;
         
                  // ...
                  Navigator.pop(context);
                },
              ),
         ),

           Obx(()=>
             ListTile(
                selected: _controller.currentIndex==2,
           
                     leading:    const CircleAvatar(
                child: Icon(Icons.calendar_today),
              ),
                onTap: () {
                       _controller.currentIndex=2;
           
                  Navigator.pop(context);
                },
              ),
           ),

           Obx(()=>
             ListTile(
                selected: _controller.currentIndex==3,
           
                     leading:    const CircleAvatar(
                child: Icon(Icons.shuffle_on),
              ),
                onTap: () {
                  _controller.currentIndex=3;
           
                  // ...
                  Navigator.pop(context);
                },
              ),
           ),
                  Obx(()=>
                   ListTile(
                                selected: _controller.currentIndex==4,
                            leading:    const CircleAvatar(
                                child: Icon(Icons.handshake),
                              ),
                                onTap: () {
                  
                                  _controller.currentIndex=4;
                  
                                  Navigator.pop(context);
                                },
                              ),
                  ),
          ],
        ),
      ),
      key: Get.find<MenuController>().scaffoldKey,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 20,),
                  //top logo,srachfiled, inbox row
                  
                  
                  TopRow(),
                      
                  const SizedBox(
                    height: 20,
                  ),
                      
                  //free tiral(notification row)
                      
                  NotificationRow(),
                  const SizedBox(
                    height: 20,
                  ),
                      
                  FiltersRow(),
                  Obx(
                    () =>
                        Expanded(child: _controller.tabs[_controller.currentIndex]),
                  ),
                ],
              ),
            ),
          )
          ,
          IconButton(icon: const Icon(Icons.menu),onPressed: (){
        
            Get.find<MenuController>().controlMenu();
          },),
        
        ],
      ),
    );

  }

  _addDesktopView(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Obx(
            () => _addNavigationRail(context),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top logo,srachfiled, inbox row
                TopRow(),
    
                const SizedBox(
                  height: 20,
                ),
    
                //free tiral(notification row)
    
                NotificationRow(),
                const SizedBox(
                  height: 20,
                ),
    
             
                Obx(
                  () =>
                      Expanded(child: _controller.tabs[_controller.currentIndex]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _addNavigationRail(BuildContext context) {
    return NavigationRail(
      //make current index as selected
      selectedIndex: _controller.currentIndex,
      onDestinationSelected: (int index) {
        //set current index

        _controller.currentIndex = index;
      },
      labelType: NavigationRailLabelType.selected,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.home),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.home),
            ),
            label: Container()),
        NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.group),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.group),
            ),
            label: Container()),
        NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.calendar_month),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.calendar_month),
            ),
            label: Container()),
                   NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.shuffle),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.shuffle),
            ),
            label: Container()),

                      NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.handshake),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.handshake),
            ),
            label: Container()),
              NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.analytics_outlined),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.analytics),
            ),
            label: Container()),
                   NavigationRailDestination(
            icon: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.money),
            ),
            selectedIcon: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.money),
            ),
            label: Container()),
      ],
    );
  }
}
