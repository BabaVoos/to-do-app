import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final void Function()? onTap;

  SignupButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(
            6.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Row(
          children: const [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
