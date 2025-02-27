import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final IconData? icon;
  final bool isObscure;
  final String labelText;
  final double maxWidth, maxHeight;
  final TextEditingController controller;

  const TextBox({
    super.key,
    this.icon,
    this.maxWidth = 350,
    this.maxHeight = 85,
    this.isObscure = false,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: icon != null ? Icon(icon) : null,
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            labelStyle: TextStyle(fontSize: 18, color: Colors.black45),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Color.fromARGB(255, 220, 220, 220),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Color.fromARGB(255, 15, 147, 255),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
