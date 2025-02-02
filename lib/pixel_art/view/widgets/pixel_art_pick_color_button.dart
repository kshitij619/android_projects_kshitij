import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/view/dialogs/color_picker_helper.dart';
import 'package:pixel_art_app/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PixelArtPickColorButton extends StatelessWidget {
  const PixelArtPickColorButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.watch<PixelArtViewModel>().selectedColor;
    final iconColor =
        ColorScheme.fromSeed(seedColor: selectedColor).inversePrimary;
    return InkWell(
      onTap: () {
        ColorPickerHelper.show(context);
      },
      child: Ink(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedColor,
        ),
        child: Icon(
          Icons.color_lens,
          color: iconColor,
        ),
      ),
    );
  }
}
