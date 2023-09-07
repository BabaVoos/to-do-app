import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hint;
  int? minLines;
  int? maxLines;
  Color? color;

  MyTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.color,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    var theme = Theme.of(
      context,
    );
    return TextFormField(
      cursorColor: theme.cardColor,
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.cardColor,
      ),
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'this filed must not be empty';
        } else {
          return null;
        }
      },
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.textTheme.displayLarge!.copyWith(
          color: Colors.grey[400],
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color ?? theme.dividerColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color ?? theme.dividerColor,
          ),
        ),
      ),
    );
  }
}
