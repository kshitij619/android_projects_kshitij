import 'package:flutter/material.dart';
import 'package:local_database/auth/model/login_request_model.dart';
import 'package:local_database/auth/view/create_account_page.dart';
import 'package:local_database/auth/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              controller: emailController,
              decoration:
                  const InputDecoration(hintText: 'Enter your email id'),
            ),
            SizedBox(height: 16),
            Text(
              'Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: '*',
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  FilledButton(
                    onPressed: loginClickEvent,
                    child: Text('Login'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateAccountPage(),
                        ),
                      );
                    },
                    child: Text('Register here'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginClickEvent() {
    context.read()<LoginViewModel>().login(
          LoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
