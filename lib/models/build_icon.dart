import 'package:flutter/material.dart';

class BuildIcon {
  final String iconUrl;
  final double position;

  const BuildIcon({required this.iconUrl, required this.position});

  Widget buildIcon() {
    return Positioned(
      right: position,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            iconUrl,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
