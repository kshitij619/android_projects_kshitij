import 'package:flutter/material.dart';
import 'package:local_database/auth/view/login_screen.dart';
import 'package:local_database/auth/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: const LoginScreen(),
    );
  }
}
