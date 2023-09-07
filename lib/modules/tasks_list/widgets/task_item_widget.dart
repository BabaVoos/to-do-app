import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../core/helpers.dart';
import '../../../models/task_model.dart';
import '../../../network_layer/firestore_utils.dart';
import '../../edit_task/edit_task_view.dart';
import 'task_delete_dialog.dart';

class TaskItemWidget extends StatelessWidget {
  final String taskId;
  final String title;
  final Timestamp date;
  final String description;
  final bool isDone;

  const TaskItemWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
    required this.isDone,
    required this.taskId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    var lang = AppLocalizations.of(context)!;
    return Dismissible(
      key: Key(
        taskId,
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (DismissDirection dismissDirection) async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => TaskDeleteDialogWidget(
            deleteOnTap: () => Navigator.pop(context, true),
            exitOnTap: () => Navigator.pop(context, false),
            text: lang.are_you_sure_you_want_to_delete_task,
          ),
        );
        return confirmed;
      },
      onDismissed: (_) {
        FireStoreDatabase.deleteTask(
          taskId: taskId,
        );
      },
      child: InkWell(
        onTap: () {
          context.pushNamed(
            widget: EditTaskView.routeName,
            arguments: TaskModel(
              taskId: taskId,
              taskTitle: title,
              taskDescription: description,
              selectedDate: date,
            ),
          );
        },
        child: Container(
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: theme.canvasColor,
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDone ? Colors.green : theme.primaryColor,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                width: 3,
                height: 60,
              ),
              const SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: isDone
                        ? theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.green,
                          )
                        : theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: theme.cardColor,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('jm').format(date.toDate()).toString(),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              isDone
                  ? TextButton(
                      onPressed: () {
                        FireStoreDatabase.taskDone(
                          taskId: taskId,
                          isDone: !isDone,
                        );
                      },
                      child: Text(
                        lang.done,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        FireStoreDatabase.taskDone(
                          taskId: taskId,
                          isDone: !isDone,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: theme.canvasColor,
                          size: 40,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
