import 'package:flutter/material.dart';
import 'package:local_database/auth/model/create_account_request_model.dart';
import 'package:local_database/auth/view/login_screen.dart';
import 'package:local_database/auth/view_model/create_account_view_model.dart';
import 'package:local_database/auth/view/widgets/loader_widget.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CreateAccountViewModel>().isLoading;

    return PopScope(
      canPop: !isLoading,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Create Account'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your name'),
                  ),
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
                          onPressed: _registerClickEvent,
                          child: Text('Register'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text('Back to Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          LoaderWidget(),
        ],
      ),
    );
  }

  void _registerClickEvent() {
    context.read<CreateAccountViewModel>().createAccount(
          CreateAccountRequestModel(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
