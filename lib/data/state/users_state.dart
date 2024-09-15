import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/user.dart';
part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  UsersState._();

  factory UsersState({
    @Default([]) List<User> users,
    @Default(true) bool isLoading,
    @Default(false) bool isError,
    @Default("") String errorMessage,
  }) = _UsersState;
}
