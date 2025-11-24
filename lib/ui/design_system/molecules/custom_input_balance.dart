import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CustomInputBalance extends StatelessWidget {
  const CustomInputBalance({
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

  @override
  Widget build(BuildContext context) {
    final highlightColor = Theme.of(context).highlightColor;
    final hintColor = Theme.of(context).hintColor;

    return TextFormField(
      controller: controller,
      onTap: onTap,
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      inputFormatters: [
        CurrencyInputFormatter(
          leadingSymbol: '',
          useSymbolPadding: false,
          thousandSeparator: ThousandSeparator.Comma,
          mantissaLength: 2,
        ),
      ],
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
