import 'package:flutter/material.dart';

class AppBackgroundImage extends StatelessWidget {
  const AppBackgroundImage({super.key, required this.image, required this.child});

  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          // alignment: Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}
