import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  Map<String, dynamic>? userData;

  // mBrics Palette
  static const Color goldBase = Color(0xFFC2994B);
  static const Color offWhite = Color(0xFFF8F9FA); 
  static const Color pureWhite = Colors.white;
  static const Color terminalBlack = Color(0xFF121212); 
  static const Color silver = Color(0xFFA7A9AC);
  static const Color terminalGreen = Color(0xFF2E7D32); 

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  // --- LOGIC: Fetching the User's Personal Name ---
  Future<void> _fetchProfile() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;
    
    final fullName = user.userMetadata?['full_name'];
    final name = user.userMetadata?['name'];
    final email = user.email;

    if (mounted) {
      setState(() {
        String displayName = "AUTHORIZED PARTNER";
        
        if (fullName != null && fullName.toString().isNotEmpty) {
          displayName = fullName.toString();
        } else if (name != null && name.toString().isNotEmpty) {
          displayName = name.toString();
        } else if (email != null) {
          displayName = email.split('@')[0];
        }

        userData = {
          'displayName': displayName.toUpperCase() 
        };
      });
    }
  }

  String _getGreeting(AppLocalizations t) {
    final hour = DateTime.now().hour;
    if (hour < 12) return t.greetingMorning;
    if (hour < 17) return t.greetingAfternoon;
    return t.greetingEvening;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 1100;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        backgroundColor: offWhite,
        body: Column(
          children: [
            _buildSystemStatusBar(t), // Passed 't' here
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isWide) Expanded(child: _buildSideInsight(true, t)),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 900),
                          child: Column(
                            children: [
                              _buildHeroHeader(t),
                              const SizedBox(height: 50),
                              _buildPillarGrid(t, screenWidth),
                              const SizedBox(height: 60),
                              _QuickAccessRow(onLocaleChange: widget.onLocaleChange, t: t), // Passed 't'
                              const SizedBox(height: 40),
                              _FooterBranding(t: t), // Passed 't'
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isWide) Expanded(child: _buildSideInsight(false, t)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemStatusBar(AppLocalizations t) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.05))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("mBrics", 
                style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, color: goldBase, letterSpacing: 1)),
              const SizedBox(width: 15),
              const _PulseDot(),
              const SizedBox(width: 8),
              Text(t.authNodeStandby.toUpperCase(), // Localized
                style: const TextStyle(fontFamily: 'ShareTechMono', color: terminalGreen, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              _miniLangBtn("EN", () => widget.onLocaleChange?.call(const Locale('en'))),
              const Text("|", style: TextStyle(color: silver, fontSize: 10)),
              _miniLangBtn("中文", () => widget.onLocaleChange?.call(const Locale('zh'))),
              const SizedBox(width: 20),
              const Text("BLOCKCHAIN v2.0", 
                style: TextStyle(fontFamily: 'ShareTechMono', color: silver, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniLangBtn(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(label, style: const TextStyle(fontFamily: 'Inter', fontSize: 10, fontWeight: FontWeight.bold, color: terminalBlack)),
      ),
    );
  }

  Widget _buildHeroHeader(AppLocalizations t) {
    return Column(
      children: [
        Text(
          _getGreeting(t),
          style: const TextStyle(fontFamily: 'Inter', color: silver, fontSize: 24, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        ),
        const SizedBox(height: 4),
        Text(
          userData?['displayName'] ?? "AUTHORIZED PARTNER", 
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'Inter', color: terminalBlack, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        const SizedBox(height: 20),
        Container(width: 60, height: 2, color: goldBase),
      ],
    );
  }

  Widget _buildPillarGrid(AppLocalizations t, double width) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: width > 800 ? 3 : 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      children: [
        _buildPillarItem(t.feature5Title, "assets/icons/mm_01.png", t.feature5Line1, '/ddp'),
        _buildPillarItem(t.feature1Title, "assets/icons/mm_02.png", t.feature1Line1, '/pay'),
        _buildPillarItem(t.feature6Title, "assets/icons/mm_03.png", t.feature6Line1, '/trust_engine'),
        _buildPillarItem(t.feature2Title, "assets/icons/mm_04.png", t.feature2Line1, '/forex'),
        _buildPillarItem(t.feature4Title, "assets/icons/mm_05.png", t.feature4Line1, '/trade_visual'),
        _buildPillarItem(t.feature3Title, "assets/icons/mm_06.png", t.feature3Line1, '/network'),
      ],
    );
  }

  Widget _buildPillarItem(String title, String assetPath, String subtitle, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          decoration: BoxDecoration(
            color: pureWhite,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 8)),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.05)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetPath, width: 45, height: 45, fit: BoxFit.contain, 
                errorBuilder: (c,e,s) => const Icon(Icons.hub_outlined, size: 30, color: goldBase)),
              const SizedBox(height: 12),
              Text(title.toUpperCase(), textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Inter', color: terminalBlack, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0.8)),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(subtitle, textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Inter', color: silver, fontSize: 9, fontWeight: FontWeight.w500, height: 1.2)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideInsight(bool isLeft, AppLocalizations t) {
    return _SideInsightCard(
      title: isLeft ? "BLOCKCHAIN STATUS" : "WEB3 ENGINE",
      icon: isLeft ? Icons.hub_outlined : Icons.auto_awesome_outlined,
      lines: isLeft 
        ? ["Finality: Valid", "Node Latency: 14ms", "Global Trade Trust: Active"]
        : [t.feature4Line2, "Doc Verification: 100%", "Digital Trust: Enabled"], // Localized line
    );
  }
}

class _PulseDot extends StatefulWidget {
  const _PulseDot();
  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller, 
      child: Container(
        width: 8, height: 8, 
        decoration: const BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle)
      )
    );
  }
}

class _SideInsightCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> lines;
  const _SideInsightCard({required this.title, required this.icon, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: const Color(0xFFC2994B)),
              const SizedBox(width: 10),
              Text(title, 
                style: const TextStyle(fontFamily: 'Inter', color: Color(0xFF121212), fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 15),
          ...lines.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline, size: 10, color: Color(0xFF2E7D32)),
                const SizedBox(width: 8),
                Expanded(child: Text(line, 
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 10, color: Colors.black54))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _QuickAccessRow extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;
  final AppLocalizations t; // Added localizations
  const _QuickAccessRow({this.onLocaleChange, required this.t});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _miniBtn("ENGLISH", () => onLocaleChange?.call(const Locale('en'))),
        const SizedBox(width: 10),
        _miniBtn("中文", () => onLocaleChange?.call(const Locale('zh'))),
        const SizedBox(width: 25),
        _miniBtn(t.logout.toUpperCase(), () async { // Localized
          await Supabase.instance.client.auth.signOut();
          if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
        }, isWarning: true),
      ],
    );
  }

  Widget _miniBtn(String label, VoidCallback onTap, {bool isWarning = false}) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: TextStyle(
        fontFamily: 'ShareTechMono',
        color: isWarning ? Colors.redAccent : const Color(0xFFC2994B), 
        fontSize: 11,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}

class _FooterBranding extends StatelessWidget {
  final AppLocalizations t; // Added localizations
  const _FooterBranding({required this.t});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black.withOpacity(0.05)),
        const SizedBox(height: 20),
        Text(t.joinNetwork.toUpperCase(), // Localized
          style: const TextStyle(fontFamily: 'Inter', fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black26, letterSpacing: 2)),
      ],
    );
  }
}