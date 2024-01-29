import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/models/hive/hive_model.dart';
import 'package:todo_app/utils/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TodoModelAdapter());

  await Hive.openBox<TodoModel>('todos');

  runApp(const MyApp());
}


