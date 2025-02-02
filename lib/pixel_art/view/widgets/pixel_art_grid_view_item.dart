import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/model/pixel_model.dart';

class PixelArtGridViewItem extends StatelessWidget {
  const PixelArtGridViewItem({
    super.key,
    required this.index,
    required this.pixel,
    required this.onTap,
  });

  final int index;
  final PixelModel pixel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        color: getColor(),
        // child: Center(
        //   child: Text('${index + 1}'),
        // ),
      ),
    );
  }

  Color? getColor() {
    if (pixel.color == null) {
      return pixel.expected?.withValues(alpha: 0.4);
    }
    return pixel.color;
  }
}
