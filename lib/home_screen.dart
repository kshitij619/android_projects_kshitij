import 'package:api_call_demo/detail_screen.dart';
import 'package:api_call_demo/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Demo'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            tooltip: 'Sort by',
          ),
        ],
      ),
      body: userProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.pictureSmall),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                selectedUser: user,
                              ))),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userProvider.fetchUsers(),
        child: Icon(Icons.download),
      ),
    );
  }
}
