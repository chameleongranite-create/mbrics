import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;
  final void Function(Locale)? onLocaleChange;

  const MasterLayout({super.key, required this.child, this.onLocaleChange});

  void _toggleLang(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      onLocaleChange?.call(const Locale('zh'));
    } else {
      onLocaleChange?.call(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.appTitle), // localized title
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _toggleLang(context),
            tooltip: t.toggleLang,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(t.navigation), // localized header
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(t.homeTitle), // localized
              onTap: () => Navigator.pushNamed(context, '/mainmenu'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(t.settings), // localized
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            t.footerText('2026'), // localized footer with year
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}