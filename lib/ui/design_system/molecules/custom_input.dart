import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.onChanged,
    required this.texthint,
    required this.label,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.onTap,
    this.controller,
    this.readOnly = false,
  });

  final ValueChanged<String> onChanged;
  final String texthint;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final highlightColor = Theme.of(context).highlightColor;
    final hintColor = Theme.of(context).hintColor;

    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: highlightColor,
              )
            : null,
        border: const OutlineInputBorder(),
        hintText: texthint,
        labelText: label,
        labelStyle: TextStyle(color: highlightColor),
        hintStyle: TextStyle(color: hintColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hintColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: highlightColor,
          ),
        ),
      ),
      validator: validator,
      style: TextStyle(
        color: highlightColor,
      ),
    );
  }
}
