import 'package:isar/isar.dart';
import 'package:task_state_no_packages/models/task.dart';

class TaskDatabase {
  late Isar isar;
  final List<Task> tasks = [];

  Future<void> addTask(Task task) async {
    final newTask = Task()
      ..taskName
      ..taskDescription
      ..taskDueDate;

    await isar.writeTxn(() => isar.tasks.put(newTask));

    fetchTasks();
  }

  Future<void> fetchTasks() async {
    List<Task> allTasks = await isar.tasks.where().findAll();
    tasks.clear();
    tasks.addAll(allTasks);
  }
}
