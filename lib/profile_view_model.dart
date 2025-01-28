import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  String name = '';
  double phone = 0;
  String dob = '';
  // final DateTime _dob;

  Future<void> loadData() async {
    final pref = await SharedPreferences.getInstance();
  }

  void notifyAll() {
    notifyListeners();
  }
}
