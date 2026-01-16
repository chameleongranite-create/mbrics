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

  // Constants for the branded look
  final Color gold = const Color(0xFFC2994B);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.settings, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // CUSTOM LANGUAGE SELECTION SECTION
            _buildSectionHeader(t.toggleLang),
            const SizedBox(height: 12),
            Row(
              children: [
                _customLangButton(
                  label: "ENGLISH",
                  asset: 'assets/icons/lang_en.png',
                  isSelected: currentLocale.languageCode == 'en',
                  onTap: () => widget.onLocaleChange?.call(const Locale('en')),
                ),
                const SizedBox(width: 16),
                _customLangButton(
                  label: "中文 (中国)",
                  asset: 'assets/icons/lang_cn.png',
                  isSelected: currentLocale.languageCode == 'zh',
                  onTap: () => widget.onLocaleChange?.call(const Locale('zh')),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(t.settings),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text(t.preferredCurrency),
              trailing: DropdownButton<String>(
                value: preferredCurrency,
                underline: Container(height: 2, color: gold),
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
              activeColor: gold,
              value: darkMode,
              onChanged: (val) => setState(() => darkMode = val),
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: Text(t.notifications),
              activeColor: gold,
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

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.2,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _customLangButton({
    required String label,
    required String asset,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? gold : Colors.grey.shade300,
                width: isSelected ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
                colorFilter: isSelected 
                    ? null 
                    : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? gold : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}