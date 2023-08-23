import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          100,
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
