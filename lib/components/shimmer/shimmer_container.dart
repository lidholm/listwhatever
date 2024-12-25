import 'package:flutter/material.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';

const imageRadius = 12.0;

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {required this.height, required this.width, super.key});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(imageRadius),
        ),
      ),
    );
  }
}
