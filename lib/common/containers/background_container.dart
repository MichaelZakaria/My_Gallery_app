import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_gallery_app/common/containers/circular_container.dart';

class MyBackGroundContainer extends StatelessWidget {
  const MyBackGroundContainer({super.key, this.child, this.left});

  final Widget? child;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                const Positioned(top: 59, left: -197 ,child: MyCircularContainer(width: 468, height: 594, backGround: Color(0xFFEA94D7))),
                const Positioned(top: 294, left: -50 ,child: MyCircularContainer(width: 683, height: 539,
                    gradient: LinearGradient(colors: [Color(0xFFFFDADA), Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter,))),
                Positioned(top: -77, left: left ?? 79 ,child: const MyCircularContainer(width: 539, height: 683, backGround: Color(0xFFddcdff))),
                const Positioned(top: 356, left: 180 ,child: MyCircularContainer(width: 147, height: 147,
                  gradient: LinearGradient(colors: [Color(0xFFFFCD62), Color(0xFFFEA12F)], begin: Alignment.topCenter, end: Alignment.bottomCenter,),)),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: child,
                  ),
                )
              ],
            ),
          )
        ],
    );
  }
}
