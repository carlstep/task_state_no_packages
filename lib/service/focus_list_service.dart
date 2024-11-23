import 'package:flutter/material.dart';
import 'package:task_state_no_packages/models/task.dart';

class FocusListService extends ChangeNotifier {
  final List<Task> focusTasks = [];

  void addTaskToFocusList(Task task) {
    if (!focusTasks.contains(task)) {
      focusTasks.add(task);
      notifyListeners();
    }
  }

  void removeTaskToFocusList(Task task) {
    if (focusTasks.contains(task)) {
      focusTasks.remove(task);
      notifyListeners();
    }
  }
}
