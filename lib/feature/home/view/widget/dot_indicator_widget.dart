import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;
  final DotsDecorator decorator;

  const DotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
    required this.decorator,
  });

Color _getDotColor(int index) {
  if (index == position) {
    return decorator.activeColor;  // Active dot color
  } else {
    return decorator.baseColor;     // Inactive dot color
  }
}


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        return Container(
          width: index == position
              ? decorator.activeSize.width
              : decorator.size.width,
          height: index == position
              ? decorator.activeSize.height
              : decorator.size.height,
          margin: decorator.spacing,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: _getDotColor(index),
            borderRadius: decorator.shape?.borderRadius,
          ),
        );
      }),
    );
  }
}

class DotsDecorator {
  final Color baseColor;
  final Color activeColor;
  final Size size;
  final Size activeSize;
  final RoundedRectangleBorder? shape;
  final EdgeInsetsGeometry spacing;

  DotsDecorator({
    required this.baseColor,
    required this.activeColor,
    required this.size,
    required this.activeSize,
    this.shape,
    required this.spacing,
  });
}
