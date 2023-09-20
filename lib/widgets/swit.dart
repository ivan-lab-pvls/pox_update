import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pockex/utils/theme/theme_provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class MySwitcher extends StatefulWidget {
  @override
  _MySwitcherState createState() => _MySwitcherState();
}

class _MySwitcherState extends State<MySwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CupertinoSwitch(
      value: themeProvider.isDark,
      onChanged: (bool newValue) {
        setState(() {
          themeProvider.setTheme();
          RxSharedPreferences.getInstance().setBool(
            "isDark",
            themeProvider.isDark,
          );
        });
      },
    );
  }
}
