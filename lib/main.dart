import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/page_one.dart';
import 'package:provider_assignment/text_controller_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextControllerViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageOne(),
      ),
    ),
  );
}
