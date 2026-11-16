import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';

class IslandArrowWidget extends StatefulWidget {
  final double width;
  final double height;

  const IslandArrowWidget({
    super.key,
    this.width = 45,
    this.height = 60,
  });

  @override
  State<IslandArrowWidget> createState() => _IslandArrowWidgetState();
}

class _IslandArrowWidgetState extends State<IslandArrowWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value.h),
          child: child,
        );
      },
      child: Image.asset(
        AppStrings.islandArrowIcon,
        width: widget.width.w,
        height: widget.height.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
