import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/business_logic/provider.dart';
import 'package:todo_application/modules/settings/widgets/my_settings_button.dart';
import 'package:todo_application/modules/settings/widgets/selected_item.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settingsView';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(
      context,
    );
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            lang.language,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.cardColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MySettingsButton(
            firstOptionOnTap: () {
              provider.changeLanguage('en');
              Navigator.pop(
                context,
              );
            },
            secondOptionOnTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(
                context,
              );
            },
            firstOption: provider.isArabic()
                ? Text(
                    lang.english,
                    style: theme.textTheme.displayLarge!.copyWith(
                      color: theme.cardColor,
                    ),
                  )
                : SelectedItem(
                    option: lang.english,
                  ),
            secondOption: provider.isArabic()
                ? SelectedItem(
                    option: lang.arabic,
                  )
                : Text(
                    lang.arabic,
                    style: theme.textTheme.displayLarge!.copyWith(
                      color: theme.cardColor,
                    ),
                  ),
            title: provider.isArabic() ? lang.arabic : lang.english,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            lang.theme_mode,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.cardColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MySettingsButton(
            firstOptionOnTap: () {
              provider.changeThemeMode(
                ThemeMode.light,
              );
              Navigator.pop(
                context,
              );
            },
            secondOptionOnTap: () {
              provider.changeThemeMode(
                ThemeMode.dark,
              );
              Navigator.pop(
                context,
              );
            },
            firstOption: provider.isDark()
                ? Text(
                    lang.light_mode,
                    style: theme.textTheme.displayLarge!.copyWith(
                      color: theme.cardColor,
                    ),
                  )
                : SelectedItem(
                    option: lang.light_mode,
                  ),
            secondOption: provider.isDark()
                ? SelectedItem(
                    option: lang.dark_mode,
                  )
                : Text(
                    lang.dark_mode,
                    style: theme.textTheme.displayLarge!.copyWith(
                      color: theme.cardColor,
                    ),
                  ),
            title: provider.isDark() ? lang.dark_mode : lang.light_mode,
          ),
        ],
      ),
    );
  }
}
