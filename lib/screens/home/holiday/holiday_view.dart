import 'package:flutter/material.dart';
import 'package:staff_managment_dashboard/constants/text_styles.dart';

class HolidayView extends StatelessWidget {
  const HolidayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("HOLIDAY VIEW ",style: StyledText.actorFontStyle.copyWith(color: Colors.blue,fontSize: 30),));
  }
}