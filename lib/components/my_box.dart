import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double radius;
  const MyBox({
    super.key,
    required this.child,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 3.0,
            blurRadius: 3.0,
          )
        ],
      ),
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(50),
      child: child,
    );
  }
}
