import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/injection/injection.dart';
import '../logic/home_cubit.dart';
import 'home_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeCubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeCubit,
      child: const HomeView(),
    );
  }
}
