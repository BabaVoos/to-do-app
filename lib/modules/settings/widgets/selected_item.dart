import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget {
  final String option;

  const SelectedItem({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return Container(
      padding: const EdgeInsets.all(
        16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: theme.cardColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: theme.textTheme.displayLarge!.copyWith(
              color: theme.cardColor,
            ),
          ),
          Icon(
            Icons.check,
            color: theme.cardColor,
          ),
        ],
      ),
    );
  }
}
