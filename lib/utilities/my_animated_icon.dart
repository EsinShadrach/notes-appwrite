import 'package:flutter/material.dart';

class MyAnimatedIcon extends StatelessWidget {
  /// Animated between two icons bases on a condition
  const MyAnimatedIcon({
    super.key,
    required this.condition,
    required this.firstIcon,
    required this.secondIcon,
  });

  final bool condition;
  final IconData firstIcon;
  final IconData secondIcon;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: condition
          ?Icon(
              firstIcon,
              key: const ValueKey(0),
            )
          : Icon(
              secondIcon,
              key: const ValueKey(1),
            ),
    );
  }
}
