import 'package:flutter/material.dart';
import 'package:todo_app/ui/pages/todos_all/todos_page.dart';
import 'package:todo_app/utils/constants/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.appTheme,
        
      home: const TodosPage()
 ); }
}