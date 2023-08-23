import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 30,
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
              color: theme.primaryColor,
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
                'Play basket ball',
                style: theme.textTheme.bodyLarge,
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
                    '10:30 AM',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ],
      ),
    );
  }
}
