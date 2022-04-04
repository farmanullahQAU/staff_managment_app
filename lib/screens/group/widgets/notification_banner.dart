import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationRow extends StatefulWidget {
  NotificationRow({Key? key}) : super(key: key);

  @override
  State<NotificationRow> createState() => _NotificationRowState();
}

class _NotificationRowState extends State<NotificationRow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    alignment: Alignment.centerLeft,
    
    children: [
    
    
    Container(
      height: 60,
      width: double.infinity,
    
    color:Get.isDarkMode?Theme.of(context).cardColor: Color.fromARGB(255, 133, 236, 240),
    
    
    child: Padding(
      padding: const EdgeInsets.only(left:20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text("you have 14 days left in your free trial"),
          Text("To continue please subscribe to... bla bla bla"),
        
      ],
        ),
    ),),
    Container(
    width: 10,
    color: Colors.cyan,height: 60,),
    
    
    
    ],);
  }
}