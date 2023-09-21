import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CardCroquis extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final int shimmerDuration;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;

  const CardCroquis({
    required this.width,
    required this.height,
    this.borderRadius=const BorderRadius.all(Radius.circular(0)),
    this.backgroundColor=Colors.grey,
    this.shimmerColor = Colors.white54,
    this.gradientColor = const Color.fromARGB(0, 244, 244, 244),
    this.curve = Curves.fastOutSlowIn,
    this.shimmerDuration = 1000,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      gradientColor: gradientColor,
      shimmerColor: shimmerColor,
      shimmerDuration: shimmerDuration,
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius
        ),
      ),
    );
  }
}
