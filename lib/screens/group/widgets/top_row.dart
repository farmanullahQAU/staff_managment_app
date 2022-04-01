import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:staff_managment_dashboard/components/text_field.dart';

import '../../../constants/constants.dart';



class TopRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [

Flexible(
  child:   Row(
  
    children: [
          Flexible(
            
            
            child:AnimatedSize(
              
                curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
              
              child: Image.asset("images/mercury.png",width:
              
              
              ResponsiveWrapper.of(context).isSmallerThan(TABLET)?50:80
              
              
              ,))),
SizedBox(

  width: 10,
),
          Flexible(


          child: TxtField(

            prefixIcon: Icon(Icons.search),
            
            isOutlined: true,
            labelText: "search",)),
    ],
  ),
),

        


          Chip(
            
            avatar: Icon(Icons.inbox),
            
            label:Text("inbox")),

            
eightWidthSizedBox,
          Chip(
            
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),  
  label: Icon(Icons.cloud_done))
      ]),
    );
  }
}