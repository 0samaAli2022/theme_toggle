import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  final double radius;
  const MyButton({
    super.key,
    required this.color,
    this.onTap,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 3.0,
              blurRadius: 3.0,
            )
          ],
        ),
      ),
    );
  }
}
