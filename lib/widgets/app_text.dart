import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color color;
  const AppText({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
