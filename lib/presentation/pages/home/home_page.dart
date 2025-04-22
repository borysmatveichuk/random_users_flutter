import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_users_flutter/data/providers/users_provider.dart';
import 'package:random_users_flutter/data/state/result_status.dart';
import 'package:random_users_flutter/router.dart';
import 'error_box.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.watch(usersProvider.notifier).handleScroll();
      }
    });

    SchedulerBinding.instance.addPostFrameCallback(
        (_) => ref.read(usersProvider.notifier).getUsers());

    /**
     * another way how to load data
     */
    //Future.microtask(() {
    //  ref.read(usersProvider.notifier).getUsers();
    //});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(usersProvider).users;
    ResultStatus status = ref.watch(usersProvider).status;

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.all(16),
              title: Text(widget.title),
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/people2.jpg'),
                      invertColors: false,
                      fit: BoxFit.cover),
                ),
              ),
              collapseMode: CollapseMode.parallax,
            ),
            automaticallyImplyLeading: false,
          ),
          CupertinoSliverRefreshControl(onRefresh: () {
            /***
             * Pay attention! refresh() method resets the state!
             */
            return ref.refresh(usersProvider.notifier).getUsers();
          }),
          if (status == ResultStatus.failure)
            SliverFillRemaining(
              child:
                  ErrorBox(errorMessage: ref.read(usersProvider).errorMessage),
            )
          else if (status == ResultStatus.inProgress && users.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (status == ResultStatus.success && users.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(
                  'No users',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            )
          else
            SliverList.separated(
              itemCount: users.length + 1,
              itemBuilder: (context, idx) {
                if (idx > users.length - 1) {
                  return const ListTile(
                      title: Center(child: CircularProgressIndicator()));
                } else {
                  return ListTile(
                    leading: ClipOval(
                        child: Image.network(users[idx].picture.thumbnail)),
                    title: Text(
                      '${users[idx].name.first} ${users[idx].name.last}',
                    ),
                    subtitle: Text(
                      '${users[idx].location.country}, ${users[idx].location.city}',
                    ),
                    onTap: () {
                      context.go(
                        AppRoutes.userDetails,
                        extra: users[idx],
                      );
                    },
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 0.5),
                );
              },
            )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
