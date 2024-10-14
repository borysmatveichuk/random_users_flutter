import 'package:freezed_annotation/freezed_annotation.dart';
import 'result_status.dart';

import '../models/user.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  UsersState._();

  factory UsersState({
    @Default([]) final List<User> users,
    @Default(ResultStatus.inProgress) ResultStatus status,
    @Default("") String errorMessage,
    @Default(1) int page,
  }) = _UsersState;
}
