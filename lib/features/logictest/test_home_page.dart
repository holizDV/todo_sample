import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/config/router/app_router.gr.dart';

import '../../config/theme/theme.dart';

@RoutePage()
class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logic Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(const Test1Route()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Test 1"),
            ),
            const SizedBox(height: AppSize.s16),
            ElevatedButton(
              onPressed: () => context.router.push(const Test2Route()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Test 2"),
            ),
            const SizedBox(height: AppSize.s16),
            ElevatedButton(
              onPressed: () => context.router.push(const Test3Route()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Test 3"),
            ),
          ],
        ),
      ),
    );
  }
}
