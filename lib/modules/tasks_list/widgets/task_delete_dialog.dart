import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskDeleteDialogWidget extends StatelessWidget {
  final String text;
  final void Function()? deleteOnTap;
  final void Function()? exitOnTap;

  const TaskDeleteDialogWidget(
      {Key? key, required this.text, this.deleteOnTap, this.exitOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: exitOnTap,
          child: Text(
            lang.no,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: deleteOnTap,
          child: Text(
            lang.delete,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
      backgroundColor: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      title: Text(
        text,
        style: theme.textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
