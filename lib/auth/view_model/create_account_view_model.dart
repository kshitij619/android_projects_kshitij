import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_database/auth/model/create_account_request_model.dart';
import 'package:local_database/database/local_database.dart';

class CreateAccountViewModel extends ChangeNotifier {
  bool isLoading = false;

  void createAccount(CreateAccountRequestModel request) async {
    try {
      isLoading = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      final id = await LocalDatabase.instance.database.insert(
        'users',
        {
          'name': request.name,
          'email': request.email,
          'password': request.password,
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        },
      );
      log('$id account created.', name: '$runtimeType');

      isLoading = false;
      notifyListeners();
    } catch (e, s) {
      log('createAccount ', name: '$runtimeType', error: e, stackTrace: s);
    }
  }
}
