import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.onChanged,
    required this.texthint,
    required this.label,
    required this.validator,
    this.obscureText = false,
    this.keyboardType,
  });

  final ValueChanged<String> onChanged;
  final String texthint;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: texthint,
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ), // Your desired focus color and width
        ),
      ),
      validator: validator,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
