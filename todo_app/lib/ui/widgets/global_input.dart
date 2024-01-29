import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color.dart';

class GlobalInput extends StatefulWidget {
  const GlobalInput({
    super.key,
    required this.text,
    this.controller,
  });

  final String text;
  final TextEditingController? controller;

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(color: AppColors.grey),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}