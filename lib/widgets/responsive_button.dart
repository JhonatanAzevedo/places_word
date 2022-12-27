import 'package:flutter/material.dart';
import 'package:places_world_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;

  const ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive ? double.maxFinite : width,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF5d69b3),
      ),
      child: Row(
        mainAxisAlignment: isResponsive
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive
              ? Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: const AppText(
                    text: 'Book Trip Now',
                    color: Colors.white,
                  ),
                )
              : Container(),
          Row(
            children: const [
              Icon(Icons.arrow_forward_ios, size: 20),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ],
      ),
    );
  }
}
