import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationContainer extends StatelessWidget{
  final Widget child;
  final int index;
  final bool vertical;
  final bool scale;
  final double distance;
  final Duration duration;

  AnimationContainer({this.child,this.index,this.vertical=true,this.distance=100,this.scale=false,this.duration});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration?? Duration(milliseconds: 300),
      child: Visibility(
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: child,
          ),
        ),
        visible: scale,
        replacement: Visibility(
          child: SlideAnimation(
            verticalOffset: distance,
            child: FadeInAnimation(
              child: child,
            ),
          ),
          visible: vertical,
          replacement: SlideAnimation(
            horizontalOffset: distance,
            child: FadeInAnimation(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

}
