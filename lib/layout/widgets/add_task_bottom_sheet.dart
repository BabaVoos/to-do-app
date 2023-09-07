import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/helpers.dart';
import '../../modules/tasks_list/widgets/add_task_button.dart';
import '../../modules/tasks_list/widgets/my_text_form_field.dart';
import '../../network_layer/firestore_utils.dart';
import 'dialog_widget.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  Timestamp selectedDate = Timestamp.fromDate(
    DateUtils.dateOnly(
      DateTime.now(),
    ),
  );

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(
      context,
    );
    return BottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: false,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: theme.canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 30,
        ),
        height: context.screenHeight / 2,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                lang.add_new_task,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: theme.cardColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextFormField(
                color: theme.cardColor,
                hint: lang.enter_your_task,
                controller: titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextFormField(
                color: theme.cardColor,
                hint: lang.enter_your_task_description,
                controller: descriptionController,
                minLines: 3,
                maxLines: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                lang.select_time,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: theme.cardColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 365,
                      ),
                    ),
                  ).then(
                    (value) {
                      selectedDate = Timestamp.fromDate(
                        DateUtils.dateOnly(
                          value!,
                        ),
                      );
                      setState(() {});
                    },
                  );
                },
                child: Text(
                  timestampFormatter(
                    selectedDate,
                  ),
                  style: theme.textTheme.displayLarge,
                ),
              ),
              const Spacer(),
              AddTaskButton(
                borderRadius: 12.0,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    FireStoreDatabase.addTask(
                      taskTitle: titleController.text,
                      taskDescription: descriptionController.text,
                      selectedDate: selectedDate,
                    ).then(
                      (value) {
                        Navigator.pop(context);
                        titleController.clear();
                        descriptionController.clear();
                        showDialog(
                          context: context,
                          builder: (context) => DialogWidget(
                            text: lang.task_added,
                          ),
                        ).catchError(
                          (error) {
                            print(error);
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => DialogWidget(
                                text: lang.try_again_later,
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
                text: lang.add_task,
              ),
            ],
          ),
        ),
      ),
      onClosing: () {},
    );
  }
}
