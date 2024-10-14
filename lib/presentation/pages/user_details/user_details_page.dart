import 'package:flutter/material.dart';
import 'package:random_users_flutter/data/models/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(height: 2);
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text('Profile'),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipOval(child: Image.network(user.picture.large)),
                  ),
                  Text(
                    '${user.name.first} ${user.name.last}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'tel: ${user.phone}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Gender: ',
                          style: titleStyle,
                        ),
                        Icon(
                          user.gender == Gender.male
                              ? Icons.male
                              : Icons.female,
                          size: 28,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Country: ',
                          style: titleStyle,
                        ),
                        Text(
                          user.location.country,
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'State: ',
                          style: titleStyle,
                        ),
                        Text(
                          user.location.state,
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'City: ',
                          style: titleStyle,
                        ),
                        Text(
                          user.location.city,
                          style: titleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
