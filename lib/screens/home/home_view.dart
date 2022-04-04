import 'package:flutter/material.dart';
import 'package:staff_managment_dashboard/constants/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("HOME",style: StyledText.actorFontStyle.copyWith(color: Colors.blue,fontSize: 30),));
  }
}