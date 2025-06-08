// lib/loading/loading_overlay.dart

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), 
        child: Container(
          alignment: Alignment.center,
          color: Colors.white.withOpacity(0.3),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen), 
            ),
          ),
        ),
      ),
    );
  }
}