import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.forEmail,
    required this.icon,
    required this.controller, required this.validationText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool forEmail;
  final IconData icon;
  final String validationText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: forEmail ? TextInputType.emailAddress : TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validationText;
        }
        if (forEmail && !value.contains('@')) {
          return "Please Enter a Valid Email Address";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
