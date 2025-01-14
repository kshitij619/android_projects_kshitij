import 'package:flutter/material.dart';
import 'package:state_management_practice/counter_page.dart';
import 'package:state_management_practice/counter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:state_management_practice/login_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter - Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MeraNayaTextWidget(),
            IncrementButton(),
            DecrementButton(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'login $hashCode',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
            child: Icon(Icons.login),
          ),
          SizedBox(height: 24),
          FloatingActionButton(
            heroTag: 'counter $hashCode',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CounterPage(),
              ));
            },
            child: Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<CounterViewModel>().decrement();
      },
      // onPressed: () {},
      child: Text('Decrement'),
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<CounterViewModel>().increment();
      },
      child: Text('Increment'),
    );
  }
}

class MeraNayaTextWidget extends StatelessWidget {
  const MeraNayaTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterViewModel>().counter;
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
