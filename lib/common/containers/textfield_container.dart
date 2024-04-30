import 'package:flutter/material.dart';
import 'package:my_gallery_app/utils/validation.dart';
import '../../controllers/login_controller.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller, required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.white,),
      child: TextFormField(
          controller: controller,
          validator: (value) => MyValidator.validateEmptyText(value, labelText),
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[500]),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          )
      ),
    );
  }
}