import 'package:go_router/go_router.dart';
import 'package:random_users_flutter/presentation/pages/home/home_page.dart';
import 'package:random_users_flutter/presentation/pages/user_details/user_details_page.dart';

import 'data/models/user.dart';

class AppRoutes {
  static const String home = '/';
  static const String userDetails = '/user_details';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(title: 'Users'),
        routes: [
          GoRoute(
            path: AppRoutes.userDetails,
            builder: (context, state) {
              final User user = state.extra as User;
              return UserDetailsPage(user: user);
            },
          ),
        ]),
  ],
);
