import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/page_two.dart';
import 'package:provider_assignment/text_controller_view_model.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<StatefulWidget> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    TextControllerViewModel controller =
        Provider.of<TextControllerViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.textFieldController,
                decoration: InputDecoration(
                  hintText: 'Enter text here...',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PageTwo(),
                    ),
                  );
                },
                child: Text('Go to Page Two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
