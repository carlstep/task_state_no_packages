import 'package:flutter/material.dart';
import 'package:task_state_no_packages/main.dart';

class FocusListScreen extends StatelessWidget {
  const FocusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusListService = FocusListContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: focusListService.focusTasks.isEmpty
            ? const Text('Focus List')
            : ListenableBuilder(
                listenable: focusListService,
                builder: (context, child) =>
                    Text('${focusListService.focusTasks.length} - Focus Tasks'),
              ),
      ),
      body: ListenableBuilder(
        listenable: focusListService,
        builder: (context, child) {
          if (focusListService.focusTasks.isEmpty) {
            return const Center(
              child: Text('You Have No Focus Tasks Selected'),
            );
          } else {
            return ListView.builder(
              itemCount: focusListService.focusTasks.length,
              itemBuilder: (context, index) {
                final task = focusListService.focusTasks[index];

                return Card(
                  child: ListTile(
                    title: Text(task.taskName),
                    trailing: IconButton(
                      onPressed: () =>
                          focusListService.removeTaskToFocusList(task),
                      icon: Icon(Icons.star),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
