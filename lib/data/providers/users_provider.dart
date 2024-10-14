import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_users_flutter/data/repositories/user_repository_impl.dart';
import 'package:random_users_flutter/data/state/result_status.dart';
import 'package:random_users_flutter/main.dart';

import '../repositories/user_repository.dart';
import '../state/users_state.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  final repository = ref.read(usersRepositoryProvider);
  final logger = ref.read(loggerProvider);

  return UsersNotifier(
    repository,
    logger: logger,
  );
});

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this.repository, {this.logger}) : super(UsersState());

  final UserRepository repository;
  final Logger? logger;

  Future<void> getUsers() async {
    state = state.copyWith(
      status: ResultStatus.inProgress,
      errorMessage: '',
    );
    final response = await repository.getUsers(page: state.page);
    state = response.fold(
      (l) => state.copyWith(
        status: ResultStatus.success,
        errorMessage: '',
        users: [...state.users, ...l],
        page: state.page + 1,
      ),
      (r) {
        logger?.d(r.error.toString());
        logger?.d(r.stackTrace);
        return state.copyWith(
          status: ResultStatus.failure,
          errorMessage: r.error.toString(),
        );
      },
    );
  }

  void handleScroll() {
    getUsers();
  }
}
