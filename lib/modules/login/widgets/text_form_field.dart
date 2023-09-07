import 'package:flutter/material.dart';
import 'package:todo_application/core/colors.dart';

class LoginTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String? Function(String?)? validator;
  final String labelText;

  LoginTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: const BorderSide(
              color: AppColors.blueColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: const BorderSide(
              color: AppColors.blueColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: const BorderSide(
              color: AppColors.blueColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
