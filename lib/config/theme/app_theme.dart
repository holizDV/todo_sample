import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: AppColor.background,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.blue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.blue,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        titleTextStyle: Typograph.textXlMedium.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.surfacelight,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.surfacelight,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          side: const BorderSide(color: AppColor.surfacelight, width: 1.0),
        ),
      ));
}
