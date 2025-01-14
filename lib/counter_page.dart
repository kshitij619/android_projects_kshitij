import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_practice/counter_screen.dart';
import 'package:state_management_practice/counter_view_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const CounterScreen(),
    );
  }
}
