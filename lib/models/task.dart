import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  late String taskName;
  late String taskDescription;
  late DateTime taskDueDate;
}
