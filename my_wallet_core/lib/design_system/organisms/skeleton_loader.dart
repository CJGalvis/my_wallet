import 'package:flutter/material.dart';

class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

     final baseColor = isDark
        ? const Color.fromARGB(131, 66, 66, 66)
        : const Color.fromARGB(121, 224, 224, 224);

    final highlightColor = isDark
        ? const Color.fromARGB(122, 97, 97, 97)
        : const Color.fromARGB(128, 245, 245, 245);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.0 - 3 * _controller.value, 0),
              end: Alignment(1.0 + 3 * _controller.value, 0),
              colors: [baseColor, highlightColor, baseColor],
            ),
          ),
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
