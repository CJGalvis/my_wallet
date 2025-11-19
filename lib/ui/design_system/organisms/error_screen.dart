import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tokens/tokens.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ilErrorScreen,
              width: 200,
            ),
            Text(textErrorScreen),
          ],
        ),
      ),
    );
  }
}
