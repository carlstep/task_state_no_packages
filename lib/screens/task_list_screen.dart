import 'package:flutter/material.dart';
import 'package:task_state_no_packages/main.dart';
import 'package:task_state_no_packages/widgets/focus_list_button.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskDatabase = TaskContainer.of(context);
    final focusListService = FocusListContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Inbox'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FocusListButton(),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: focusListService,
        builder: (context, child) => ListView.builder(
          itemCount: taskDatabase.tasks.length,
          itemBuilder: (context, index) {
            final task = taskDatabase.tasks[index];
            final setToFocus = focusListService.focusTasks.contains(task);

            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
              child: Card(
                child: ListTile(
                  title: Text(task.taskName),
                  subtitle: Text(task.taskInfo),
                  onTap: setToFocus
                      ? null
                      : () => focusListService.addTaskToFocusList(task),
                  trailing: setToFocus
                      ? const Icon(
                          Icons.star,
                        )
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
