import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_users_flutter/data/models/app_error.dart';
import 'package:random_users_flutter/data/models/user.dart';
import 'package:random_users_flutter/data/repositories/user_repository.dart';
import 'package:dio/dio.dart';

import '../services/rest_client.dart';

final httpClientProvider = Provider<Dio>((ref) => Dio());
final restClientProvider =
    Provider<RestClient>((ref) => RestClient(ref.read(httpClientProvider)));

final usersRepositoryProvider = Provider<UserRepository>((ref) {
  final restClient = ref.watch(restClientProvider);
  final repository = UserRepositoryImpl(restClient: restClient);
  return repository;
});

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<RepositoryResult<List<User>>> getUsers({required int page}) async {
    try {
      final result = await restClient.getUsers(page);
      return RepositoryResult.right(result.results);
    } catch (e, trace) {
      return RepositoryResult.left(AppError(e, trace));
    }
  }
}
