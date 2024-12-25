import 'package:flutter/material.dart';

const imageRadius = 12.0;

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {required this.height, required this.width, super.key});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(imageRadius),
      ),
    );
  }
}
