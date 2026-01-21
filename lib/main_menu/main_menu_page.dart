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

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null && args.containsKey('displayName')) {
        setState(() {
          userData = {
            'displayName': args['displayName'],
            'isGuest': args['isGuest'] ?? true,
          };
        });
        return;
      }

      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        final String? fullName = user.userMetadata?['full_name'];
        final String? name = user.userMetadata?['name'];
        setState(() {
          userData = {
            'displayName': fullName ?? name ?? user.email?.split('@')[0] ?? "Partner",
            'isGuest': false
          };
        });
      } else {
        setState(() => userData = {'displayName': "Visitor", 'isGuest': true});
      }
    });
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
    final isWide = screenWidth >= 1200;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FB),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              _buildSystemStatusBar(t),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isWide) Expanded(child: _buildSideInsight(true, t)),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1000),
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
        border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.06))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("mBrics", style: TextStyle(color: Color(0xFF997531), letterSpacing: 2.0, fontSize: 13, fontWeight: FontWeight.w900)),
              const SizedBox(width: 20),
              const _PulseDot(),
              const SizedBox(width: 10),
              Text(t.globalTrustActive.toUpperCase(), style: const TextStyle(color: Color(0xFF2E7D32), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
            ],
          ),
          Row(
            children: [
              _miniLangBtn("EN", () => widget.onLocaleChange?.call(const Locale('en'))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text("|", style: TextStyle(color: Colors.grey.shade300, fontSize: 12)),
              ),
              _miniLangBtn("中文", () => widget.onLocaleChange?.call(const Locale('zh'))),
              const SizedBox(width: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.08)), borderRadius: BorderRadius.circular(4)),
                child: const Text("WEB3 ENGINE v2.0", style: TextStyle(color: Colors.black26, fontSize: 9, fontWeight: FontWeight.w900)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniLangBtn(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black45)),
      ),
    );
  }

  Widget _buildHeroHeader(AppLocalizations t) {
    final nameToDisplay = userData?['displayName'] ?? "Partner";
    return Column(
      children: [
        Text(_getGreeting(t).toUpperCase(), style: const TextStyle(color: Color(0xFF997531), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 2)),
        const SizedBox(height: 12),
        // FIXED: Using localized mainGreeting placeholder instead of hardcoded English
        Text(
          t.mainGreeting(nameToDisplay).toUpperCase(), 
          textAlign: TextAlign.center, 
          style: const TextStyle(color: Color(0xFF333333), fontSize: 32, letterSpacing: -1.0, fontWeight: FontWeight.w900)
        ),
        const SizedBox(height: 15),
        Container(width: 50, height: 3, decoration: BoxDecoration(color: const Color(0xFF997531), borderRadius: BorderRadius.circular(2))),
      ],
    );
  }

  Widget _buildPillarGrid(AppLocalizations t, double width) {
    bool isMobile = width < 600;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 1 : (width > 900 ? 3 : 2),
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      childAspectRatio: isMobile ? 1.2 : 0.82, 
      children: [
        _HoverPillarItem(title: t.pillar1Title, assetPath: "assets/icons/icon_4.png", subtitle: t.pillar1Subtitle, route: '/ddp'),
        _HoverPillarItem(title: t.pillar2Title, assetPath: "assets/icons/icon_2.png", subtitle: t.pillar2Subtitle, route: '/pay'),
        _HoverPillarItem(title: t.pillar3Title, assetPath: "assets/icons/icon_3.png", subtitle: t.pillar3Subtitle, route: '/trust_engine'),
        _HoverPillarItem(title: t.pillar4Title, assetPath: "assets/icons/icon_5.png", subtitle: t.pillar4Subtitle, route: '/forex'),
        _HoverPillarItem(title: t.pillar5Title, assetPath: "assets/icons/icon_6.png", subtitle: t.pillar5Subtitle, route: '/visualizer'),
        _HoverPillarItem(title: t.pillar6Title, assetPath: "assets/icons/icon_1.png", subtitle: t.pillar6Subtitle, route: '/network'),
      ],
    );
  }

  Widget _buildSideInsight(bool isLeft, AppLocalizations t) {
    return _SideInsightCard(
      title: isLeft ? t.blockchainStatus : t.web3EngineTitle,
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

  static const Color brandGold = Color(0xFF997531);
  static const Color deepSteel = Color(0xFF333333); 
  static const Color graphite = Color(0xFF666666);  

  @override
  Widget build(BuildContext context) {
    final parts = widget.subtitle.split('\n');
    final String subHead = parts.isNotEmpty ? parts[0] : "";
    final String subDesc = parts.length > 1 ? parts[1] : "";

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered ? (Matrix4.identity()..translate(0, -10, 0)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? brandGold.withOpacity(0.15) : Colors.black.withOpacity(0.04), 
              blurRadius: _isHovered ? 40 : 20, 
              offset: const Offset(0, 15)
            )
          ],
          border: Border.all(
            color: _isHovered ? brandGold : Colors.black.withOpacity(0.08), 
            width: _isHovered ? 2.5 : 1.2
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(widget.assetPath, height: 55, 
                        errorBuilder: (c,e,s) => const Icon(Icons.token_outlined, size: 45, color: brandGold)),
                      const SizedBox(height: 15),
                      Text(widget.title.toUpperCase(), 
                        textAlign: TextAlign.center, 
                        style: const TextStyle(color: deepSteel, fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 0.8)),
                      const SizedBox(height: 8),
                      if (subHead.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: brandGold.withOpacity(0.08), borderRadius: BorderRadius.circular(4)),
                          child: Text(subHead.toUpperCase(), 
                            style: const TextStyle(color: brandGold, fontSize: 8.5, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
                        ),
                      const SizedBox(height: 10),
                      Text(subDesc, 
                        textAlign: TextAlign.center, 
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: graphite, fontSize: 11, height: 1.4, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: brandGold.withOpacity(_isHovered ? 0.2 : 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right_rounded, 
                    size: 18, 
                    color: brandGold,
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, widget.route),
                    splashColor: brandGold.withOpacity(0.12),
                    highlightColor: brandGold.withOpacity(0.05),
                  ),
                ),
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
  final List<String> lines;
  const _SideInsightCard({required this.title, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.security, size: 18, color: Color(0xFF997531)),
              const SizedBox(width: 12),
              Expanded(child: Text(title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1.2, color: Color(0xFF333333)))),
            ],
          ),
          const SizedBox(height: 25),
          ...lines.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(Icons.verified_user_outlined, size: 12, color: Color(0xFF2E7D32)),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(line, style: const TextStyle(fontSize: 10, color: Color(0xFF666666), fontWeight: FontWeight.w600))),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _miniBtn("EN", () => onLocaleChange?.call(const Locale('en'))),
          const SizedBox(width: 15),
          _miniBtn("中文", () => onLocaleChange?.call(const Locale('zh'))),
          const SizedBox(width: 20),
          Container(width: 1, height: 15, color: Colors.black12),
          const SizedBox(width: 20),
          _miniBtn(t.terminateSession.toUpperCase(), () async {
            await Supabase.instance.client.auth.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          }, isWarning: true),
        ],
      ),
    );
  }

  Widget _miniBtn(String label, VoidCallback onTap, {bool isWarning = false}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12)),
      child: Text(label, style: TextStyle(color: isWarning ? Colors.redAccent.withOpacity(0.7) : const Color(0xFF997531), fontSize: 11, fontWeight: FontWeight.w900)),
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
      child: Container(
        width: 8, height: 8, 
        decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle, boxShadow: [BoxShadow(color: Color(0xFF4CAF50), blurRadius: 4)])
      )
    );
  }
}

class _FooterBranding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("mBrics WEB3 ENGINE • GLOBAL TRADE TRUST PROTOCOL", 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9, color: Colors.black26, letterSpacing: 3, fontWeight: FontWeight.bold)),
      ],
    );
  }
}