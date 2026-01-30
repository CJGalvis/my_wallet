import 'dart:ui';

import 'package:flutter/material.dart';


class Loading {
  Loading(this.context);

  final BuildContext context;
  bool _isLoading = false;

  void show({String message = 'Cargando...'}) {
    _isLoading = true;

    showGeneralDialog<void>(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: PopScope(
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator.adaptive(),
                      const SizedBox(height: 5),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((_) => _isLoading = false);
  }

  void hide() {
    if (context.mounted) {
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }
    }
  }

  bool isLoading() => _isLoading;
}