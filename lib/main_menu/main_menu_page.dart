import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, required this.onLocaleChange});
  final void Function(Locale) onLocaleChange;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  late List<Map<String, dynamic>> items;
  Map<String, dynamic>? userData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final t = AppLocalizations.of(context)!;
    items = [
      {'title': t.forex, 'icon': Icons.currency_exchange, 'route': '/forex'},
      {'title': t.ddp, 'icon': Icons.local_shipping, 'route': '/ddp'},
      {'title': t.payTitle, 'icon': Icons.payment, 'route': '/pay'},
      {'title': t.escrowTitle, 'icon': Icons.security, 'route': '/escrow'},
      {'title': t.settings, 'icon': Icons.settings, 'route': '/settings'},
    ];
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;

    try {
      final data = await Supabase.instance.client
          .from('users')
          .select('full_name')
          .eq('id', uid)
          .single();

      setState(() {
        userData = data;
      });
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) return; // stay on main menu
    Navigator.pushNamed(context, items[index - 1]['route'] as String);
  }

  void _toggleLang(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange(const Locale('zh'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.homeTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _toggleLang(context),
            tooltip: t.toggleLang,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          if (userData != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome, ${userData!['full_name'] ?? ''}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ...List.generate(items.length, (index) {
            final item = items[index];
            return Column(
              children: [
                ListTile(
                  leading: Icon(item['icon'] as IconData, color: Colors.blue),
                  title: Text(item['title'] as String),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () =>
                      Navigator.pushNamed(context, item['route'] as String),
                ),
                const Divider(),
              ],
            );
          }),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: Text(t.logout),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
          const Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: t.homeTitle),
          BottomNavigationBarItem(
              icon: const Icon(Icons.currency_exchange), label: t.forex),
          BottomNavigationBarItem(
              icon: const Icon(Icons.local_shipping), label: t.ddp),
          BottomNavigationBarItem(
              icon: const Icon(Icons.security), label: t.escrowTitle),
          BottomNavigationBarItem(
              icon: const Icon(Icons.payment), label: t.payTitle),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: t.settings),
        ],
      ),
    );
  }
}