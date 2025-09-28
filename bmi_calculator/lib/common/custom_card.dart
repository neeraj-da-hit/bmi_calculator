import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTap;
final Color? color;
  final Widget? child;
  const CustomCard({super.key, this.child, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        child: child,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}