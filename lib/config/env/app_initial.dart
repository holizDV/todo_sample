import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/todo/data/model/todos.dart';
import '../../utils/injection/injection.dart';
import '../theme/app_color.dart';

abstract class AppInitial {
  AppInitial() {
    _init();
  }

  FutureOr<StatelessWidget> onCreate();

  void _init() {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: AppColor.blue,
          statusBarIconBrightness: Brightness.light,
        ),
      );

      configureInjection();

      await Hive.initFlutter();
      Hive.registerAdapter(TodosAdapter());
      await Hive.openBox<Todos>("todos_box");

      final app = await onCreate();

      // if (BuildConfig.isDebugLayout()) {
      //   runApp(DevicePreview(
      //     enabled: !kReleaseMode,
      //     builder: (_) => app,
      //   ));
      // } else {
      runApp(app);
      // }
    }, (error, stack) {
      debugPrint("$error: $stack");
    });
  }
}
