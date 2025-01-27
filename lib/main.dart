import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preference Demo'),
        ),
        body: const SharedPreferenceExample(),
      ),
    ),
  );
}

class SharedPreferenceExample extends StatefulWidget {
  const SharedPreferenceExample({super.key});

  @override
  State<StatefulWidget> createState() => _SharedPreferenceExampleState();
}

class _SharedPreferenceExampleState extends State<SharedPreferenceExample> {
  String thoughtForTheDay = 'Hello all';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadThought();
  }

  Future<void> _loadThought() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      thoughtForTheDay = pref.getString('thought') ?? 'No Data Available';
    });
  }

  Future<void> _saveThought() async {
    thoughtForTheDay = _controller.text;

    final pref = await SharedPreferences.getInstance();
    pref.setString('thought', thoughtForTheDay);

    _loadThought();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thought for the day: ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
          Text(
            thoughtForTheDay,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w200,
            ),
          ),
          Spacer(),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter your thought...',
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              // onPressed: () {
              //   setState(() {
              //     thoughtForTheDay = _controller.text;
              //     _controller.clear();
              //     log(thoughtForTheDay);
              //   });
              // },
              onPressed: () {
                _saveThought;
                _controller.clear();
              },
              child: const Text('Save my thought'),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
