import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;
    
    final String? fullName = user.userMetadata?['full_name'];
    final String? name = user.userMetadata?['name'];
    final String? email = user.email;

    if (mounted) {
      setState(() {
        String displayName = "Partner";
        if (fullName != null && fullName.isNotEmpty) {
          displayName = fullName;
        } else if (name != null && name.isNotEmpty) {
          displayName = name;
        } else if (email != null) {
          displayName = email.split('@')[0];
        }
        userData = {'displayName': displayName};
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
        backgroundColor: const Color(0xFFF2F4F7), // Institutional soft grey
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(), // Mobile flicker fix
          child: Column(
            children: [
              _buildSystemStatusBar(t),
              Padding(
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
                              _QuickAccessRow(onLocaleChange: widget.onLocaleChange, t: t),
                              const SizedBox(height: 40),
                              _FooterBranding(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isWide) Expanded(child: _buildSideInsight(false, t)),
                  ],
                ),
              ),
            ],
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("mBRICS", style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, letterSpacing: 1.5, fontSize: 14)),
              const SizedBox(width: 15),
              const _PulseDot(),
              const SizedBox(width: 8),
              Text(t.globalTrustActive.toUpperCase(), style: MBricsTheme.monoStyle.copyWith(color: const Color(0xFF2E7D32), fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              _miniLangBtn("EN", () => widget.onLocaleChange?.call(const Locale('en'))),
              const Text("|", style: TextStyle(color: MBricsTheme.silver, fontSize: 10)),
              _miniLangBtn("中文", () => widget.onLocaleChange?.call(const Locale('zh'))),
              const SizedBox(width: 20),
              Text("WEB3 ENGINE v2.0", style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.silver, fontSize: 10)),
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
        child: Text(label, style: MBricsTheme.bodyStyle.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
      ),
    );
  }

  Widget _buildHeroHeader(AppLocalizations t) {
    final nameToDisplay = userData?['displayName'] ?? "Partner";
    return Column(
      children: [
        Text(_getGreeting(t), style: MBricsTheme.bodyStyle.copyWith(color: MBricsTheme.silver, fontSize: 18, fontWeight: FontWeight.w300)),
        const SizedBox(height: 8),
        Text(
          t.mainGreeting(nameToDisplay), 
          textAlign: TextAlign.center, 
          style: MBricsTheme.headingStyle.copyWith(color: Colors.black, fontSize: 28, letterSpacing: -0.5)
        ),
        const SizedBox(height: 20),
        Container(width: 40, height: 2, color: MBricsTheme.goldBase),
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
        _HoverPillarItem(title: t.pillar1Title, assetPath: "assets/icons/mm_01.png", subtitle: t.pillar1Subtitle, route: '/ddp'),
        _HoverPillarItem(title: t.pillar2Title, assetPath: "assets/icons/mm_02.png", subtitle: t.pillar2Subtitle, route: '/pay'),
        _HoverPillarItem(title: t.pillar3Title, assetPath: "assets/icons/mm_03.png", subtitle: t.pillar3Subtitle, route: '/trust_engine'),
        _HoverPillarItem(title: t.pillar4Title, assetPath: "assets/icons/mm_04.png", subtitle: t.pillar4Subtitle, route: '/forex'),
        _HoverPillarItem(title: t.pillar5Title, assetPath: "assets/icons/mm_05.png", subtitle: t.pillar5Subtitle, route: '/visualizer'),
        _HoverPillarItem(title: t.pillar6Title, assetPath: "assets/icons/mm_06.png", subtitle: t.pillar6Subtitle, route: '/network'),
      ],
    );
  }

  Widget _buildSideInsight(bool isLeft, AppLocalizations t) {
    return _SideInsightCard(
      title: isLeft ? t.blockchainStatus : t.web3EngineTitle,
      icon: isLeft ? Icons.hub_outlined : Icons.auto_awesome_outlined,
      lines: isLeft 
        ? [t.finalityValid, t.nodeLatency, t.globalTrustActive]
        : [t.docVerification, t.digitalTrustEnabled, "Protocol Level Encryption"],
    );
  }
}

class _HoverPillarItem extends StatefulWidget {
  final String title;
  final String assetPath;
  final String subtitle;
  final String route;
  const _HoverPillarItem({required this.title, required this.assetPath, required this.subtitle, required this.route});

  @override
  State<_HoverPillarItem> createState() => _HoverPillarItemState();
}

class _HoverPillarItemState extends State<_HoverPillarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _isHovered ? (Matrix4.identity()..translate(0, -8, 0)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? MBricsTheme.goldBase.withOpacity(0.15) : Colors.black.withOpacity(0.03), 
                blurRadius: _isHovered ? 25 : 15, 
                offset: const Offset(0, 10)
              )
            ],
            border: Border.all(
              color: _isHovered ? MBricsTheme.goldBase : Colors.black.withOpacity(0.05), 
              width: _isHovered ? 1.5 : 1
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.assetPath, height: 40, 
                errorBuilder: (c,e,s) => const Icon(Icons.token_outlined, size: 30, color: MBricsTheme.goldBase)),
              const SizedBox(height: 15),
              Text(widget.title.toUpperCase(), textAlign: TextAlign.center, 
                style: MBricsTheme.headingStyle.copyWith(color: Colors.black, fontSize: 11, letterSpacing: 0.5)),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(widget.subtitle, textAlign: TextAlign.center, 
                  style: MBricsTheme.bodyStyle.copyWith(color: Colors.black54, fontSize: 9, height: 1.3)),
              ),
            ],
          ),
        ),
      ),
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
              Icon(icon, size: 16, color: MBricsTheme.goldBase),
              const SizedBox(width: 10),
              Text(title.toUpperCase(), style: MBricsTheme.monoStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 20),
          ...lines.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                const Icon(Icons.shield_outlined, size: 12, color: Color(0xFF2E7D32)),
                const SizedBox(width: 10),
                Expanded(child: Text(line, style: MBricsTheme.bodyStyle.copyWith(fontSize: 10, color: Colors.black54))),
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
  final AppLocalizations t;
  const _QuickAccessRow({this.onLocaleChange, required this.t});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _miniBtn("EN", () => onLocaleChange?.call(const Locale('en'))),
        const SizedBox(width: 10),
        _miniBtn("中文", () => onLocaleChange?.call(const Locale('zh'))),
        const SizedBox(width: 30),
        _miniBtn(t.terminateSession.toUpperCase(), () async {
          await Supabase.instance.client.auth.signOut();
          Navigator.pushReplacementNamed(context, '/login');
        }, isWarning: true),
      ],
    );
  }

  Widget _miniBtn(String label, VoidCallback onTap, {bool isWarning = false}) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: MBricsTheme.monoStyle.copyWith(
        color: isWarning ? Colors.redAccent : MBricsTheme.goldBase, 
        fontSize: 12,
        fontWeight: FontWeight.bold,
      )),
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
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller, 
      child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle))
    );
  }
}

class _FooterBranding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black.withOpacity(0.05)),
        const SizedBox(height: 20),
        Text("mBRICS WEB3 ENGINE • GLOBAL TRADE TRUST PROTOCOL", 
          style: MBricsTheme.monoStyle.copyWith(fontSize: 9, color: Colors.black26, letterSpacing: 2)),
      ],
    );
  }
}