import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.hint,
      this.suffixIcon,
      this.preffixIcon,
      this.controller});
  final String? hint;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        alignLabelWithHint: true,
        
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0), // Adjust this value as needed

        prefixIcon: preffixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
