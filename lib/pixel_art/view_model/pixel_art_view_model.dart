import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/global/extensions/color_hex_extension.dart';
import 'package:pixel_art_app/pixel_art/model/pixel_model.dart';
import 'package:pixel_art_app/pixel_art/services/pixel_art_data.dart';

final size = 24;

class PixelArtViewModel extends ChangeNotifier {
  List<PixelModel> list = List.generate(
      size * size,
      (index) => PixelModel(
            expected: HexColor.fromHex(PixelArtData.drawing[index]),
          ));

  Color selectedColor = Colors.white;

  void paintPixelEvent(int index) {
    list[index] = PixelModel(color: selectedColor);

    notifyListeners();
  }

  void changeSelectedColor(Color? pickedColor) {
    if (pickedColor == null) return;
    selectedColor = pickedColor;
    notifyListeners();
  }
}
