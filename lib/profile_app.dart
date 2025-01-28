import 'package:flutter/material.dart';
import 'package:shared_preferences_assignment/edit_profile_screen.dart';
import 'package:shared_preferences_assignment/profile_page.dart';
// import 'package:shared_preferences_assignment/profile_screen.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        leading: Icon(Icons.person),
        elevation: 5,
      ),
      body: const ProfilePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        },
        child: Icon(Icons.edit_note_rounded),
      ),
    );
  }
}
