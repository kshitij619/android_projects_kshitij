import 'dart:developer';
import 'package:api_call_demo/api_service.dart';
import 'package:api_call_demo/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      log("Error fetching users: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
