import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageAvatar extends StatelessWidget {
  final String imageUrl;
  final Alignment? alignment;
  final String tagId;
  const ImageAvatar({Key? key,required this.imageUrl,required this.tagId,required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: tagId,
 createRectTween: (begin, end) {
        // Create and return your custom rect
        return MaterialRectArcTween(begin: begin, end: end);
      },
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            color: Colors.red.withOpacity(1 - animation.value),
          ),
        );
      },
      child: Align(
        alignment: this.alignment!,
        child: CircleAvatar(
      backgroundColor: Theme.of(context).dividerColor,
          radius: 43,
          child: CircleAvatar(
            radius: 40,
            
            child:Image.asset(imageUrl,fit: BoxFit.cover,) ),
        ),
      ),
    );
  }
}

