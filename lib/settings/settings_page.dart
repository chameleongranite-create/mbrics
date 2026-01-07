import "../layout/master_layout.dart";
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, this.onLocaleChange});

  final void Function(Locale)? onLocaleChange;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String preferredCurrency = 'CNY';
  bool darkMode = false;
  bool notificationsEnabled = true;

  void _toggleLang() {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange?.call(const Locale('zh'));
    } else {
      widget.onLocaleChange?.call(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.settings),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: _toggleLang,
              tooltip: t.toggleLang,
            ),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text(t.preferredCurrency),
              trailing: DropdownButton<String>(
                value: preferredCurrency,
                items: ['CNY', 'ZAR']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) => setState(() => preferredCurrency = val!),
              ),
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: Text(t.darkMode),
              value: darkMode,
              onChanged: (val) => setState(() => darkMode = val),
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: Text(t.notifications),
              value: notificationsEnabled,
              onChanged: (val) => setState(() => notificationsEnabled = val),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.api),
              title: Text(t.apiSource),
              subtitle: const Text('Frankfurter (default)'),
            ),
          ],
        ),
      ),
    );
  }
}