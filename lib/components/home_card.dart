import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  final String title;
  final String imageUrl;
  VoidCallback onTap;


   HomeCard({Key? key,required this.title, required this.imageUrl,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(

      onTap:onTap,
      child: Container(
    
    
        child: Text("home Card"),
      ),
    ));
  }
}