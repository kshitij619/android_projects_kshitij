import 'package:flutter/material.dart';

class TextControllerViewModel extends ChangeNotifier {
  final _textFieldController = TextEditingController();

  TextEditingController get textFieldController => _textFieldController;
}
