import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import 'theme.dart';

abstract class Typograph {
  static TextStyle textXlMedium = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s20,
    fontWeight: FontWeight.w500,
    height: AppSize.s30 / FontSize.s20,
  );

  static TextStyle textLgSemiBold = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w600,
    height: AppSize.s24 / FontSize.s16,
  );
  static TextStyle textLgMedium = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w500,
    height: AppSize.s24 / FontSize.s16,
  );
  static TextStyle textLgRegular = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w400,
    height: AppSize.s24 / FontSize.s16,
  );

  static TextStyle textMdSemiBold = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w600,
    height: AppSize.s20 / FontSize.s14,
  );
  static TextStyle textMdMedium = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w500,
    height: AppSize.s20 / FontSize.s14,
  );
  static TextStyle textMdRegular = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w400,
    height: AppSize.s20 / FontSize.s14,
  );

  static TextStyle textSmSemiBold = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w600,
    height: AppSize.s16 / FontSize.s12,
  );
  static TextStyle textSmMedium = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w500,
    height: AppMargin.m16 / FontSize.s12,
  );
  static TextStyle textSmRegular = const TextStyle(
    color: AppColor.textPrimary,
    fontFamily: FontFamily.poppins,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w400,
    height: AppSize.s16 / FontSize.s12,
  );
}
