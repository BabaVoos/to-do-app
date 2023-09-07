import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double? borderRadius;

  const AddTaskButton(
      {Key? key, required this.onTap, required this.text, this.borderRadius})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    var theme = Theme.of(
      context,
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(
            borderRadius!,
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
