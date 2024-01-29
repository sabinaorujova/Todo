import 'package:flutter/material.dart';
import 'package:todo_app/data/models/hive/hive_model.dart';


class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onSelect,
    required this.onChanged,
    required this.isChecked,
  });

  final TodoModel todo;
  final void Function()? onDelete;
  final void Function()? onSelect;
  final void Function(bool?)? onChanged;
  final bool isChecked;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
 final  bool isChecked = false;
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.blueGrey.shade100,
      leading: Checkbox(
        value: widget.todo.isChecked,
        onChanged: widget.onChanged,
      ),
      title: Text(
        widget.todo.title,
        style: TextStyle(
          decoration:
              widget.todo.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        widget.todo.subTitle,
        style: TextStyle(
          decoration:
              widget.todo.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: GestureDetector(
          onTap: widget.onDelete, child: const Icon(Icons.delete_rounded)),
      onTap: widget.onSelect,
    );
  }
}
