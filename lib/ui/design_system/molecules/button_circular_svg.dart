import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tokens/tokens.dart';

class ButtonCircularSVG extends StatelessWidget {
  const ButtonCircularSVG({
    super.key,
    required this.bottomLabel,
    required this.callback,
    required this.path,
  });

  final String bottomLabel;
  final VoidCallback callback;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: radiusbuttonCircular,
          height: radiusbuttonCircular,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: callback,
            icon: SvgPicture.asset(
              path,
              width: iconButtonCircularSize,
              colorFilter: ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
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
