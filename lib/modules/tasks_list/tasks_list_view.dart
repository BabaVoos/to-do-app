import 'package:flutter/material.dart';
import 'package:todo_application/modules/tasks_list/widgets/calendar_item.dart';
import 'package:todo_application/modules/tasks_list/widgets/task_item_widget.dart';

class TasksListView extends StatefulWidget {
  static const String routeName = 'tasksListView';

  const TasksListView({Key? key}) : super(key: key);

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CalendarItem(
          selectedDate: selectedDate,
          onDateSelected: (
            date,
          ) =>
              setState(
            () => selectedDate = date,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (
              context,
              index,
            ) =>
                const TaskItemWidget(),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}
