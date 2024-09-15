import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_users_flutter/data/providers/users_provider.dart';

class ErrorBox extends ConsumerWidget {
  const ErrorBox({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => ref.refresh(usersProvider.notifier).getUsers(1),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
