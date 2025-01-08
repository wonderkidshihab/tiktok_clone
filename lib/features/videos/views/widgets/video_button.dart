import 'package:deentok/constants/gaps.dart';
import 'package:deentok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoButton extends StatelessWidget {
  final IconData icon;
  final String? text;
  final Color? color;

  const VideoButton({
    super.key,
    required this.icon,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: color ?? Colors.white,
          size: Sizes.size24,
        ),
        Gaps.v5,
        text != null
            ? Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
      ],
    );
  }
}
