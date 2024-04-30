import 'package:flutter/material.dart';

class MyCircularContainer extends StatelessWidget {
  const MyCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 50,
    this.backGround = Colors.white,
    this.child,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.borderColor = Colors.transparent,
    this.gradient,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color backGround;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color borderColor;
  final Gradient? gradient;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(width!,height!)),
          gradient: gradient,
          //BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null ,
          color: backGround
      ),
      child: child,
    );
  }
}