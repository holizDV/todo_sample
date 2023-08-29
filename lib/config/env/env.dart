import 'package:envied/envied.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'env.g.dart';

@Envied(path: ".dev.env", obfuscate: true)
abstract class DevEnv {
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _DevEnv.baseUrl;
}

@Envied(path: ".prod.env", obfuscate: true)
abstract class ProdEnv {
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _ProdEnv.baseUrl;
}

enum EnvironmentType { dev, prod }

class AppEnvironment {
  static final AppEnvironment _singleton = AppEnvironment._internal();

  factory AppEnvironment() => _singleton;

  AppEnvironment._internal();

  Future<EnvironmentType> getCurrentEnv() async {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (packageInfo.packageName) {
      case "com.debmind.todolist.dev":
        return EnvironmentType.dev;
      case "com.debmind.todolist":
        return EnvironmentType.prod;
      default:
        return EnvironmentType.dev;
    }
  }

  Future<String> getBaseUrlBasedOnEnv() async {
    final currentEnv = await getCurrentEnv();

    if (currentEnv == EnvironmentType.dev) {
      return Future.value(DevEnv.baseUrl);
    } else if (currentEnv == EnvironmentType.prod) {
      return Future.value(ProdEnv.baseUrl);
    } else {
      return Future.value(ProdEnv.baseUrl);
    }
  }
}
