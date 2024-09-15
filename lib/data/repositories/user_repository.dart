import 'package:fpdart/fpdart.dart';
import 'package:random_users_flutter/data/models/user.dart';

import '../models/app_error.dart';

typedef RepositoryResult<T> = Either<T, AppError>;

abstract interface class UserRepository {
  Future<RepositoryResult<List<User>>> getUsers({
    required int page,
  });
}
