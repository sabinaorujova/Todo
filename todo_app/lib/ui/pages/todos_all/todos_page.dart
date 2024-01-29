import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/allerts/sheets/sheet.dart';
import 'package:todo_app/data/models/hive/hive_model.dart';
import 'package:todo_app/ui/widgets/todo_tile.dart';
import 'package:todo_app/utils/helpers/navigate.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController subTitleController = TextEditingController();

  bool isChecked = false;

  bool get isDelete =>
      Hive.box<TodoModel>('todos').values.any((todo) => todo.isChecked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Todos'),
      ),
      body: ValueListenableBuilder<Box<TodoModel>>(
        valueListenable: Hive.box<TodoModel>('todos').listenable(),
        builder: (context, box, _) {
          final todoBox = box.values.toList().cast<TodoModel>();
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: todoBox.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              final todo = todoBox[index];
              return TodoTile(
                isChecked: isChecked,
                todo: todo,
                onChanged: (v) {
                  isChecked = v!;
                  todo.isChecked = isChecked;
                  setState(() {});
                },
                onSelect: () {
                  isChecked = !isChecked;
                  todo.isChecked = isChecked;
                  setState(() {});
                },
                onDelete: () {
                  todo.delete();
                  setState(() {});
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: isDelete ? const Text('Delete') : const Text('Add'),
        icon: isDelete ? const Icon(Icons.delete) : const Icon(Icons.add),
        onPressed: isDelete ? deleteSelectedTodos : showAddSheet,
      ),
    );
  }

  void deleteSelectedTodos() {
    Hive.box<TodoModel>('todos')
        .values
        .where((todo) => todo.isChecked)
        .toList()
        .forEach((todo) {
      todo.delete();
    });
    setState(() {});
  }

  void showAddSheet() {
    Sheets.add(
      context,
      () {
        final todoBox = Hive.box<TodoModel>('todos');
        TodoModel todoModel = TodoModel();
        todoModel
          ..id = '5'
          ..title = titleController.text
          ..subTitle = subTitleController.text
          ..isChecked = false;

        todoBox.add(todoModel);
        Navigate.back(context);
        setState(() {});
      },
      titleController,
      subTitleController,
    );
  }
}
