import 'package:flutter/material.dart';
import 'package:places_world_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? label;
  final IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final bool isIcon;
  const AppButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.label,
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor,
      ),
      child: !isIcon
          ? Center(
              child: AppText(
                text: label!,
                color: color,
              ),
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
