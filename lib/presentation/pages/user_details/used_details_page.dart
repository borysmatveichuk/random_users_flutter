import 'package:flutter/material.dart';
import 'package:random_users_flutter/data/models/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${user.name.first} ${user.name.last}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Text('${user.name.first} ${user.name.last}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
