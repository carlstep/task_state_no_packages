import 'package:task_state_no_packages/models/task.dart';

class TaskDatabase {
  final List<Task> tasks = [
    Task(
      taskId: '001',
      taskName: 'paint the walls',
      taskInfo: 'taskInfo',
    ),
    Task(
      taskId: '002',
      taskName: 'cut the grass',
      taskInfo: 'taskInfo',
    ),
    Task(
      taskId: '003',
      taskName: 'fix the fence',
      taskInfo: 'taskInfo',
    ),
    Task(
      taskId: '004',
      taskName: 'tidy the house',
      taskInfo: 'taskInfo',
    ),
    Task(
      taskId: '005',
      taskName: 'walk the cats',
      taskInfo: 'taskInfo',
    ),
    Task(
      taskId: '006',
      taskName: 'haircut',
      taskInfo: 'taskInfo',
    ),
  ];
}
