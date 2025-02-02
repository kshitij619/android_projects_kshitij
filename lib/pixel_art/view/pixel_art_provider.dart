import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/view/pixel_art_screen.dart';
import 'package:pixel_art_app/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PixelArtProvider extends StatelessWidget {
  const PixelArtProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PixelArtViewModel(),
      child: PixelArtScreen(),
    );
  }
}
