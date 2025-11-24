import 'dart:ui';

class NewPocketArgs {
  final String language;
  final VoidCallback onPressedPrimaryButton;

  NewPocketArgs({
    required this.language,
    required this.onPressedPrimaryButton,
  });
}
