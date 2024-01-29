import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color.dart';
import 'package:todo_app/utils/constants/input_borders.dart';

class AppThemes {
  AppThemes._();
  static ThemeData get appTheme => ThemeData(
primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          border:InputBorders.inputBorder(AppColors.primary),
          enabledBorder: InputBorders.inputBorder(AppColors.primary),
          focusedBorder: InputBorders.inputBorder(AppColors.primary),
          errorBorder: InputBorders.inputBorder(AppColors.red),
          focusedErrorBorder: InputBorders.inputBorder(AppColors.red),
        )




  );

}
