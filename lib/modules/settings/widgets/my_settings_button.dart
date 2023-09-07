import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';

class MySettingsButton extends StatelessWidget {
  // final String firstOption;
  // final String secondOption;
  final String title;
  final Widget firstOption;
  final Widget secondOption;
  final void Function()? firstOptionOnTap;
  final void Function()? secondOptionOnTap;

  const MySettingsButton({
    Key? key,
    required this.firstOption,
    required this.secondOption,
    required this.title,
    this.firstOptionOnTap,
    this.secondOptionOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          showBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) => BottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              backgroundColor: theme.canvasColor,
              enableDrag: false,
              onClosing: () {},
              builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
                width: double.infinity,
                height: context.screenHeight / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: firstOptionOnTap,
                      child: firstOption,
                    ),
                    const SizedBox(
                      height: 20,
                            ),
                            InkWell(onTap: secondOptionOnTap, child: secondOption),
                          ],
                        ),
                      ),
                ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.canvasColor,
            border: Border.all(
              color: theme.primaryColor,
            ),
          ),
          margin: const EdgeInsets.only(
            top: 10,
          ),
          padding: const EdgeInsets.all(
            10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
