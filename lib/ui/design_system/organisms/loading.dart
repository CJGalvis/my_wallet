import 'package:flutter/material.dart';

class Loading {
  static final Loading _instance = Loading._internal();
  factory Loading() => _instance;
  Loading._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
