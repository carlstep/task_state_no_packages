import 'package:flutter/material.dart';
import 'package:task_state_no_packages/datasource/task_database.dart';
import 'package:task_state_no_packages/screens/focus_list_screen.dart';
import 'package:task_state_no_packages/screens/task_list_screen.dart';
import 'package:task_state_no_packages/service/focus_list_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskContainer(
      taskDatabase: TaskDatabase(),
      child: FocusListContainer(
        focusListService: FocusListService(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
            useMaterial3: true,
          ),
          home: const TaskListScreen(),
        ),
      ),
    );
  }
}

class TaskContainer extends InheritedWidget {
  final TaskDatabase taskDatabase;

  const TaskContainer({
    super.key,
    required super.child,
    required this.taskDatabase,
  });

  @override
  bool updateShouldNotify(TaskContainer oldWidget) {
    return oldWidget.taskDatabase != taskDatabase;
  }

  static TaskDatabase of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskContainer>()!
        .taskDatabase;
  }
}

class FocusListContainer extends InheritedWidget {
  final FocusListService focusListService;

  const FocusListContainer({
    super.key,
    required super.child,
    required this.focusListService,
  });

  @override
  bool updateShouldNotify(FocusListContainer oldWidget) {
    return oldWidget.focusListService != focusListService;
  }

  static FocusListService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FocusListContainer>()!
        .focusListService;
  }
}
