import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  String _name = '';
  double _phone = 0;
  String _dob = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      _name = pref.getString('name') ?? 'No name found';
      _phone = pref.getDouble('phone') ?? 0;
      _dob = pref.getString('dob') ?? 'No dob found';
    });
  }

  Future<void> saveData() async {
    _name = _nameController.text;
    _phone = double.parse(_phoneController.text);
    _dob = _dobController.text;

    final pref = await SharedPreferences.getInstance();

    pref.setString('name', _name);
    pref.setDouble('phone', _phone);
    pref.setString('dob', _dob);

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Phone: ',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone number',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'DOB: ',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                hintText: 'Date of birth',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text('Submit'),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Name: $_name',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Phone: $_phone',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'DOB: $_dob',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
