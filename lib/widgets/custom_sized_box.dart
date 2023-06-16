import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  const CustomSizedBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
