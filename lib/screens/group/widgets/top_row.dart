import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:staff_managment_dashboard/components/text_field.dart';
import 'package:staff_managment_dashboard/screens/Setting/settings_view.dart';
import 'package:staff_managment_dashboard/screens/staff/staff_view_controller.dart';

import '../../../constants/constants.dart';

class TopRow extends StatelessWidget {
  final _controller = Get.find<StaffViewController>();

  TopRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Row(
            children: [
              Flexible(
                  child: AnimatedSize(
                      curve: Curves.easeIn,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        "images/mercury.png",
                        width:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? 50
                                : 80,
                      ))),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                  child: TxtField(
                onChanged: (String value) {
             _controller.isSearching= value.trim()==""?false:true;

                  _controller.serachedKeyWord = value;
                },
                controller: _controller.searchFieldTextEditingController,
                prefixIcon: Icon(Icons.search),
                isOutlined: true,
                labelText: "search",
              )),
            ],
          ),
        ),
        Obx(
 
                   () => 
                  CupertinoSwitch(
                    activeColor: Theme.of(context).backgroundColor,
                    trackColor: Colors.cyan,
                               value: Get.find<SettingsController>().isDark,
                               onChanged: (val)=> Get.find<SettingsController>().changeTheme()
                             ),
                 ),
        eightWidthSizedBox,

        Chip(avatar: Icon(Icons.inbox), label: Text("inbox")),
        eightWidthSizedBox,
        
        Chip(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            label: Icon(Icons.cloud_done))
      ]),
    );
  }
}
