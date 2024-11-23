import 'package:flutter/material.dart';
import 'package:task_state_no_packages/main.dart';
import 'package:task_state_no_packages/screens/focus_list_screen.dart';

class FocusListButton extends StatelessWidget {
  const FocusListButton({super.key});

  @override
  Widget build(BuildContext context) {
    final focusListService = FocusListContainer.of(context);

    return TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FocusListScreen(),
        ),
      ),
      child: Row(
        children: [
          ListenableBuilder(
            listenable: focusListService,
            builder: (context, child) => Text(
              '${focusListService.focusTasks.length}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Icon(
            Icons.star,
            size: 26,
          ),
        ],
      ),
    );
  }
}
