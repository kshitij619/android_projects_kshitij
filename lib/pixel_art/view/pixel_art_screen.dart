import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/view/widgets/pixel_grid_builder_widget.dart';
import 'package:pixel_art_app/pixel_art/view/widgets/pixel_art_pick_color_button.dart';

class PixelArtScreen extends StatelessWidget {
  const PixelArtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Art'),
        actions: [
          PixelArtPickColorButton(),
        ],
      ),
      body: PixelGridBuilderWidget(),
    );
  }
}
