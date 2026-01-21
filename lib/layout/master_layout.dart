import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/mbrics_theme.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;
  final void Function(Locale)? onLocaleChange;

  const MasterLayout({
    super.key,
    required this.child,
    this.onLocaleChange,
  });

  // Using colors from your mbrics_theme for consistency
  static const Color gold = MBricsTheme.goldBase;
  static const Color charcoal = MBricsTheme.terminalBlack;
  static const Color silver = MBricsTheme.silver;

  @override
  Widget build(BuildContext context) {
    // Initialize localization
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: charcoal,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onLocaleChange?.call(const Locale('en')),
              child: const Text("mBrics ENGINE", 
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ),
            GestureDetector(
              onTap: () => onLocaleChange?.call(const Locale('zh')),
              child: const Text("数字引擎", 
                style: TextStyle(color: gold, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildDrawerHeader(t),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // Section: Core Navigation
                    _drawerSection(t.menuCoreNavigation.toUpperCase()), 
                    _drawerItem(context, Icons.grid_view_rounded, t.menuMainHome, '/mainmenu'),
                    
                    // Section: Web3 Modules
                    _drawerSection(t.menuWeb3Modules.toUpperCase()),
                    
                    // Pillar 1: DDP Logistics
                    _drawerItem(context, Icons.local_shipping_outlined, t.menuGlobalDelivery, '/ddp'),
                    
                    // Pillar 2: Settlement Engine
                    _drawerItem(context, Icons.account_balance_wallet_outlined, t.menuGlobalPay, '/pay'),
                    
                    // Pillar 3: Trust Engine
                    _drawerItem(context, Icons.security_rounded, t.menuGlobalTrust, '/trust_engine'),
                    
                    // Pillar 4: Network Hub
                    _drawerItem(context, Icons.hub_outlined, t.menuGlobalNetwork, '/network'),
                    
                    // Pillar 5: Trade Visualizer
                    _drawerItem(context, Icons.location_searching_rounded, t.menuGlobalTracking, '/visualizer'),
                    
                    // Pillar 6: Forex Bridge
                    _drawerItem(context, Icons.currency_exchange_rounded, t.menuGlobalForex, '/forex'),
                    
                    const Divider(height: 40),
                    // Exit Terminal
                    _drawerItem(context, Icons.logout, t.menuExitTerminal, '/login'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: child,
    );
  }

  Widget _buildDrawerHeader(AppLocalizations t) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 24),
      color: charcoal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.account_balance, color: gold, size: 36),
          const SizedBox(height: 16),
          const Text("mBrics", 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
          // Sub-header using menuWeb3Modules for consistency in simple language
          Text(t.menuWeb3Modules.toUpperCase(), 
            style: const TextStyle(color: silver, fontSize: 10, letterSpacing: 1.5)),
        ],
      ),
    );
  }

  Widget _drawerSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 10),
      child: Text(title, 
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: silver, letterSpacing: 1.1)),
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: gold, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: charcoal)),
      onTap: () {
        Navigator.pop(context); 
        Navigator.pushReplacementNamed(context, route); 
      },
    );
  }
}