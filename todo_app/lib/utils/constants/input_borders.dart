import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/radius.dart';


class InputBorders {
  static OutlineInputBorder inputBorder(Color borderColor) =>
      OutlineInputBorder(
        borderRadius: AppRadiuses.a10,
        borderSide: BorderSide(
          color: borderColor,
        ),
      );
}