import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_users_flutter/data/providers/users_provider.dart';
import 'package:random_users_flutter/router.dart';
import 'error_box.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(usersProvider.notifier).getUsers(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = ref
        .watch(usersProvider)
        .users;
    bool isLoading = ref
        .watch(usersProvider)
        .isLoading;
    bool isError = ref
        .watch(usersProvider)
        .isError;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Builder(builder: (context) {
        if (isError) {
          return ErrorBox(errorMessage: ref
              .read(usersProvider)
              .errorMessage);
        } else if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (users.isEmpty) {
          return Center(
            child: Text(
              'No users',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(usersProvider.notifier).getUsers(1);
          },
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, idx) {
              return ListTile(
                title: Text(
                  '${users[idx].name.first} ${users[idx].name.last}',
                ),
                subtitle: Text(
                  '${users[idx].location.country}, ${users[idx].location.city}',
                ),
                onTap: () {
                  print('${users[idx].name.first} ${users[idx].name.last}');
                  context.go(AppRoutes.home + AppRoutes.userDetails,
                    extra: users[idx],
                  );
                },
              );
            },
          ),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
