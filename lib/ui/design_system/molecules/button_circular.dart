import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class ButtonCircular extends StatelessWidget {
  const ButtonCircular({
    super.key,
    required this.bottomLabel,
    required this.callback,
    required this.icon,
  });

  final String bottomLabel;
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: radiusButtonCircular,
          height: radiusButtonCircular,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: callback,
            icon: Icon(
              icon,
              size: iconButtonCircularSize,
            ),
          ),
        ),
        Text(
          bottomLabel,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
