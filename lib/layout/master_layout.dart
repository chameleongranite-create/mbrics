import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;
  final void Function(Locale)? onLocaleChange;

  const MasterLayout({
    super.key,
    required this.child,
    this.onLocaleChange,
  });

  // Reusable colors from your palette
  static const Color gold = Color(0xFFC2994B);
  static const Color charcoal = Color(0xFF343A40);
  static const Color silver = Color(0xFFA7A9AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. ADDING THE APPBAR (Provides the Hamburger Menu)
      appBar: AppBar(
        backgroundColor: charcoal,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onLocaleChange?.call(const Locale('en')),
              child: Text("mBRICS BRIDGE", 
                style: TextStyle(fontFamily: 'Inter',color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
              onTap: () => onLocaleChange?.call(const Locale('zh')),
              child: const Text("数字货币桥", 
                style: TextStyle(color: Color(0xFFFF3B30), fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      
      // 2. THE INSTITUTIONAL SIDEBAR
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildDrawerHeader(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _drawerSection("TRUSTED NETWORK"),
                    _drawerItem(context, Icons.hub_outlined, "Member Directory", '/network'),
                    
                    _drawerSection("TRADE SERVICES"),
                    _drawerItem(context, Icons.local_shipping_outlined, "DDP Logistics", '/quote_visual'),
                    _drawerItem(context, Icons.gavel_outlined, "Web3 Contracts", '/trade_visual'),
                    
                    _drawerSection("FINANCIAL TOOLS"),
                    _drawerItem(context, Icons.currency_exchange, "Forex Engine", '/forex'),
                    _drawerItem(context, Icons.account_balance_wallet_outlined, "mBrics Pay", '/pay'),
                    
                    const Divider(height: 40),
                    _drawerItem(context, Icons.settings_outlined, "Settings", '/settings'),
                    _drawerItem(context, Icons.logout, "Exit Terminal", '/login'),
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

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 24),
      color: charcoal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.account_balance, color: gold, size: 36),
          const SizedBox(height: 16),
          Text("mBRICS", 
            style: TextStyle(fontFamily: 'Inter',color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
          const Text("INSTITUTIONAL PORTAL", 
            style: TextStyle(color: silver, fontSize: 10, letterSpacing: 1.5)),
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
        Navigator.pop(context); // Close drawer
        Navigator.pushNamed(context, route); // Navigate
      },
    );
  }
}