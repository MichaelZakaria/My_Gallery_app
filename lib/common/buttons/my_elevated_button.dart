import 'package:flutter/material.dart';
import '../../controllers/login_controller.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 20,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          'SUBMIT' ,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
  }
}