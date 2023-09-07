import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/helpers.dart';
import '../../models/task_model.dart';
import '../../network_layer/firestore_utils.dart';
import '../tasks_list/widgets/add_task_button.dart';
import '../tasks_list/widgets/my_text_form_field.dart';

class EditTaskView extends StatefulWidget {
  static const String routeName = 'editTaskView';

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  Timestamp selectedDate = Timestamp.now();

  @override
  Widget build(
    BuildContext context,
  ) {
    var theme = Theme.of(
      context,
    );
    var args = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var lang = AppLocalizations.of(context)!;

    titleController.text = args.taskTitle!;
    descriptionController.text = args.taskDescription!;
    selectedDate = args.selectedDate!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.to_do_list,
        ),
        toolbarHeight: context.screenHeight * .10,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
          ),
          height: context.screenHeight * 0.7,
          width: context.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: theme.canvasColor,
          ),
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                lang.edit_task,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.cardColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MyTextFormField(
                hint: lang.enter_your_task,
                controller: titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextFormField(
                hint: lang.enter_your_task_description,
                controller: descriptionController,
                maxLines: 5,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                lang.select_time,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.cardColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectedDate.toDate(),
                    firstDate: selectedDate.toDate(),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 365,
                      ),
                    ),
                  ).then((value) {
                    selectedDate = Timestamp.fromDate(value!);
                    setState(() {});
                  });
                },
                child: Text(
                  timestampFormatter(
                    selectedDate,
                  ),
                  style: theme.textTheme.displayLarge,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: AddTaskButton(
                  onTap: () async {
                    await FireStoreDatabase.updateTask(
                      taskId: args.taskId!,
                      taskTitle: titleController.text,
                      taskDescription: descriptionController.text,
                      selectedDate: selectedDate,
                    ).then(
                      (value) => Navigator.pop(
                        context,
                      ),
                    );
                  },
                  text: lang.save_changes,
                  borderRadius: 25.0,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
