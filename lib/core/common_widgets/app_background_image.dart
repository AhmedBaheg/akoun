
import 'package:flutter/material.dart';

class AppBackgroundImage extends StatelessWidget {
  const AppBackgroundImage({
    super.key,
    required this.image,
    required this.child,
    this.alignment,
    this.imageScale = 1.0,
  });

  final String image;
  final Widget child;
  final AlignmentGeometry? alignment;
  final double imageScale;

  @override
  Widget build(BuildContext context) {
    final imageAlignment = alignment ?? Alignment.center;

    return SizedBox.expand(
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.scale(
              scale: imageScale,
              alignment: imageAlignment,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: imageAlignment,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
