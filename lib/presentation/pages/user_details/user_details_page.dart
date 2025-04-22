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
                    _InfoWidget(title: 'Country', info: user.location.country),
                    _InfoWidget(title: 'State', info: user.location.state),
                    _InfoWidget(title: 'City', info: user.location.city),
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

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(height: 2);
    return Row(
      children: [
        Text(
          '$title: ',
          style: titleStyle,
        ),
        Text(
          info,
          style: titleStyle,
        ),
      ],
    );
  }
}
