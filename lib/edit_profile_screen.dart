import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_assignment/profile_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profile = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your data'),
        leading: const Icon(Icons.edit_document),
      ),
      body: Padding(
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
                  profile.name = _nameController.text;
                  profile.dob = _dobController.text;
                  profile.phone = double.parse(_phoneController.text);
                  _nameController.clear();
                  _phoneController.clear();
                  _dobController.clear();
                  profile.notifyAll();
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
