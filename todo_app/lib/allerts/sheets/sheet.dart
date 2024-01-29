import 'package:flutter/material.dart';
import 'package:todo_app/ui/widgets/global_input.dart';

class Sheets {
  Sheets._();
  static void add(
      ctx,
      void Function() onAdd,
      TextEditingController titleController,
      TextEditingController subtitleController) {
    titleController.clear();
    subtitleController.clear();
    showModalBottomSheet(
        context: ctx,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GlobalInput(
                  text: 'title',
                  controller: titleController,
                ),
                SizedBox(height: 24),
                GlobalInput(
                  text: 'Subtitle',
                  controller: subtitleController,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onAdd,
                  child: Text('Add'),
                )
              ],
            ),
          );
        });
  }
}
