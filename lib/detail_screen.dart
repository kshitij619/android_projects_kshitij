import 'package:api_call_demo/user_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User selectedUser;

  const DetailScreen({super.key, required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUser.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(selectedUser.pictureLarge),
              ),
            ),
            SizedBox(height: 16),
            Text(
              selectedUser.email,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Gender: ${selectedUser.gender}',
              style: TextStyle(
                color:
                    (selectedUser.gender == 'male' ? Colors.blue : Colors.pink),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('Phone: ${selectedUser.phone}'),
            Text('Location: ${selectedUser.city}, ${selectedUser.country}'),
          ],
        ),
      ),
    );
  }
}
