import 'package:flutter/material.dart';
import '../layout/master_layout.dart';
import '../l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool securityEnabled = false;
  bool darkMode = false;
  String currentLanguage = 'en';

  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color borderGray = Color(0xFFE0E0E0);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color gold = Color(0xFFC2994B);
  static const Color textDark = Color(0xFF343A40);
  static const Color textSoft = Color(0xFF666666);

  void _toggleLang() {
    if (currentLanguage == 'en') {
      widget.onLocaleChange?.call(const Locale('zh'));
      setState(() => currentLanguage = 'zh');
    } else {
      widget.onLocaleChange?.call(const Locale('en'));
      setState(() => currentLanguage = 'en');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        backgroundColor: backgroundWhite,
        appBar: AppBar(
          title: Text(t.settingsHeader),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: _toggleLang,
              tooltip: t.languageLabel,
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: borderGray),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Icon header
                      Center(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/icons/edit_settings_01.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        t.settingsHeader,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      Text(
                        t.settingsSubtitle,
                        style: const TextStyle(fontSize: 14, color: textSoft),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: silver.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderGray, width: 1.2),
                        ),
                        child: Text(
                          t.settingsInfoBlock,
                          style: const TextStyle(
                            fontSize: 14,
                            color: textDark,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Notifications toggle
                      SwitchListTile(
                        title: Text(t.notificationsLabel),
                        subtitle: Text(t.notificationsDesc),
                        value: notificationsEnabled,
                        activeColor: gold,
                        onChanged: (val) {
                          setState(() => notificationsEnabled = val);
                        },
                      ),
                      const Divider(color: borderGray),

                      // Security toggle
                      SwitchListTile(
                        title: Text(t.securityLabel),
                        subtitle: Text(t.securityDesc),
                        value: securityEnabled,
                        activeColor: gold,
                        onChanged: (val) {
                          setState(() => securityEnabled = val);
                        },
                      ),
                      const Divider(color: borderGray),

                      // Theme toggle
                      SwitchListTile(
                        title: Text(t.themeLabel),
                        subtitle: Text(t.themeDesc),
                        value: darkMode,
                        activeColor: gold,
                        onChanged: (val) {
                          setState(() => darkMode = val);
                        },
                      ),
                      const Divider(color: borderGray),

                      // Language dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(t.languageLabel),
                              subtitle: Text(t.languageDesc),
                            ),
                          ),
                          DropdownButton<String>(
                            value: currentLanguage,
                            items: const [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'zh',
                                child: Text('中文'),
                              ),
                            ],
                            onChanged: (val) {
                              if (val != null) {
                                setState(() => currentLanguage = val);
                                widget.onLocaleChange?.call(Locale(val));
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}