import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/config/router/app_router.gr.dart';

import '../../config/theme/theme.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Menu"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(HomeRoute()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Todo App"),
            ),
            const SizedBox(width: AppSize.s28),
            ElevatedButton(
              onPressed: () => context.router.push(const TestHomeRoute()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Logic Test"),
            )
          ],
        ),
      ),
    );
  }
}
