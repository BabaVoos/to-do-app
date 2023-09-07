import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/core/helpers.dart';

import '../../network_layer/firestore_utils.dart';
import 'widgets/calendar_item.dart';
import 'widgets/task_item_widget.dart';

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
    var lang = AppLocalizations.of(context)!;
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
        StreamBuilder<QuerySnapshot>(
          stream: FireStoreDatabase.getData(
            selectedDate: Timestamp.fromDate(
              DateUtils.dateOnly(selectedDate),
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Column(
                children: [
                  SizedBox(
                    height: context.screenHeight / 3.5,
                  ),
                  Text(
                    lang.something_went_wrong,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: context.screenHeight / 3.5,
                  ),
                  Text(
                    lang.no_tasks,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            } else {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      var data = snapshot.data!.docs[index];
                      print(snapshot.data!.docs.length);
                      return TaskItemWidget(
                        title: data['taskTitle'],
                        date: data['dateCreated'],
                        description: data['taskDescription'],
                        isDone: data['isDone'],
                        taskId: data['taskId'],
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
