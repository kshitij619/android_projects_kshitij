import 'package:flutter/material.dart';
import 'package:pixel_art_app/pixel_art/view/widgets/pixel_art_grid_view_item.dart';
import 'package:pixel_art_app/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PixelGridBuilderWidget extends StatelessWidget {
  const PixelGridBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = context.watch<PixelArtViewModel>().list;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 24,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: 24 * 24,
      itemBuilder: (context, index) {
        final pixel = list[index];
        return PixelArtGridViewItem(
          index: index,
          pixel: pixel,
          onTap: () {
            context.read<PixelArtViewModel>().paintPixelEvent(index);
          },
        );
      },
    );
  }
}
