import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/page_one.dart';
import 'package:provider_assignment/text_controller_view_model.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<StatefulWidget> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    TextControllerViewModel controller =
        Provider.of<TextControllerViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
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
                      MaterialPageRoute(builder: (context) => const PageOne()));
                },
                child: Text('Go to new Page One'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
