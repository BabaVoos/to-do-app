import 'package:flutter/material.dart';
import 'package:todo_application/modules/settings/widgets/my_settings_button.dart';
import 'package:todo_application/modules/settings/widgets/selected_item.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settingsView';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.cardColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MySettingsButton(
            firstOptionOnTap: () {},
            secondOptionOnTap: () {},
            firstOption: const SelectedItem(
              option: 'English',
            ),
            secondOption: Text(
              'Arabic',
              style: theme.textTheme.displayLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            title: 'English',
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Mode',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.cardColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MySettingsButton(
            firstOptionOnTap: () {},
            secondOptionOnTap: () {},
            firstOption: const SelectedItem(
              option: 'Light',
            ),
            secondOption: Text(
              'Dark',
              style: theme.textTheme.displayLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            title: 'Light',
          ),
        ],
      ),
    );
  }
}
