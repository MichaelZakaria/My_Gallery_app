import 'package:flutter/material.dart';
import '../../data/authentication/authentication_repository.dart';

class MyHomeElevatedButton extends StatelessWidget {
  const MyHomeElevatedButton({
    super.key, required this.icon, required this.onPressed, required this.text, required this.iconColor, this.buttonColor, this.angle
  });

  final void Function()? onPressed;
  final Icon icon;
  final String text;
  final Color iconColor;
  final Color? buttonColor;
  final double? angle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: buttonColor ?? Colors.white
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: angle ?? 0,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: iconColor),
                child: icon,
              ),
            ),
            const SizedBox(width: 8,),
            Text(text, style: const TextStyle(fontSize: 18, color: Color(0xFF4A4A4A))),
          ],
        )

    );
  }
}