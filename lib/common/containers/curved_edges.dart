import 'package:flutter/material.dart';

class MyCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // start point
    path.lineTo(0, size.height);

    // handle point
    final firstCurve = Offset(0, size.height - 20);
    // end point ( and start point for the next curve )
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    // handle point
    final secondFirstCurve = Offset(0, size.height - 20);
    // end point ( and start point for the next curve )
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    // handle point
    final thirdFirstCurve = Offset(size.width, size.height - 20);
    // end point ( and start point for the next curve )
    final thirdLastCurve = Offset(size.width , size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

/// path.line to() is for lines
///  path.quadraticBezierTo is for curves