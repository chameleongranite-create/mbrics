import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;
  const LoginScreen({super.key, this.onLocaleChange});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _visitorNameController = TextEditingController();
  
  bool _loading = false;
  bool _visitorLoading = false;
  bool _obscurePassword = true;

  // BRAND COLOR PALETTE
  static const Color goldBase = Color(0xFFC2994B);
  static const Color goldLight = Color(0xFFE5C17A);
  static const Color terminalBlack = Color(0xFF1A1A1A);
  static const Color bodyGrey = Color(0xFF5F6368);   
  static const Color silverBase = Color(0xFF70757A); 

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _visitorNameController.dispose();
    super.dispose();
  }

  String _getGreeting(AppLocalizations t) {
    final hour = DateTime.now().hour;
    if (hour < 12) return t.greetingMorning;
    if (hour < 17) return t.greetingAfternoon;
    return t.greetingEvening;
  }

  // --- MEMBER LOGIN LOGIC ---
  Future<void> _handleLogin() async {
    final t = AppLocalizations.of(context)!;
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar(t.errorEmailRequired);
      return;
    }
    setState(() => _loading = true);
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (mounted) Navigator.pushReplacementNamed(context, '/mainmenu');
    } on AuthException catch (e) {
      String message = e.message;
      if (e.message.toLowerCase().contains("invalid login credentials")) {
        message = t.errorInvalidCredentials;
      }
      _showSnackBar(message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  // --- VISITOR ACCESS LOGIC (mBrics DEMO MODE) ---
  void _handleVisitorAccess() {
    final t = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      barrierDismissible: true, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.auto_awesome_outlined, color: goldBase, size: 40),
              const SizedBox(height: 16),
              Text(
                t.visitorPopupTitle.toUpperCase(), 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: terminalBlack, letterSpacing: 0.5)
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _visitorNameController,
                autofocus: true,
                textInputAction: TextInputAction.go,
                style: const TextStyle(fontWeight: FontWeight.bold, color: terminalBlack, fontSize: 14),
                decoration: InputDecoration(
                  labelText: t.visitorNameLabel,
                  labelStyle: const TextStyle(fontSize: 11, color: silverBase),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase, width: 2)),
                ),
                onSubmitted: (_) => _finalizeVisitorEntry(),
              ),
              const SizedBox(height: 24),
              _primaryBtn(
                t.startExploring, 
                () => _finalizeVisitorEntry(), 
                isLoading: _visitorLoading
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(t.cancel.toUpperCase(), style: const TextStyle(color: silverBase, fontSize: 10, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _finalizeVisitorEntry() async {
    final guestName = _visitorNameController.text.trim();
    if (guestName.isEmpty) return;

    setState(() => _visitorLoading = true);
    
    try {
      // Capturing visitor data for the mBrics engine
      Supabase.instance.client.from('visitors').insert({
        'full_name': guestName,
        'metadata': {'platform': 'web', 'entry_point': 'login_screen', 'demo_mode': true}
      }).then((_) {}).catchError((e) => debugPrint("Log error: $e"));

      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushReplacementNamed(
          context, 
          '/mainmenu', 
          arguments: {'displayName': guestName, 'isGuest': true}
        );
      }
    } finally {
      if (mounted) {
        _visitorNameController.clear();
        setState(() => _visitorLoading = false);
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final bool showThreeCols = size.width >= 1000;
    final bool showTwoCols = size.width < 1000 && size.width > 720;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), 
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height - MediaQuery.of(context).padding.vertical,
                maxWidth: 1200,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _logoCore(t),
                    const SizedBox(height: 35),
                    _languageSwitcher(),
                    const SizedBox(height: 40),
                    if (showThreeCols)
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(child: _buildSidePillarBlock(t, true)),
                            const SizedBox(width: 20),
                            _buildAuthBlock(t),
                            const SizedBox(width: 20),
                            Flexible(child: _buildSidePillarBlock(t, false)),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          _buildAuthBlock(t),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 20, runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: [
                              _buildSidePillarBlock(t, true, fullWidth: !showTwoCols),
                              _buildSidePillarBlock(t, false, fullWidth: !showTwoCols),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 50),
                    Text(
                      t.poweredBy,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11, 
                        fontWeight: FontWeight.w800, 
                        color: silverBase.withOpacity(0.6), 
                        letterSpacing: 3.0
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoCore(AppLocalizations t) => Column(
  children: [
    // Total increase to height 100 (Original 55 -> 77 -> 100)
    Image.asset(
      'assets/mbrics_logo.png', 
      height: 100,
      filterQuality: FilterQuality.high, // Ensures no flicker/blur on scaling
    ),
    const SizedBox(height: 20),
    Text(
      t.loginSlogan.toUpperCase(), 
      textAlign: TextAlign.center,
      style: const TextStyle(
        letterSpacing: 5.0, 
        fontSize: 10, 
        color: Color(0xFFC2994B), // goldBase
        fontWeight: FontWeight.w900,
      ),
    ),
  ],
);

  Widget _languageSwitcher() => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    _langBtn("assets/icons/lang_en.png", const Locale('en'), "EN"),
    const SizedBox(width: 24),
    _langBtn("assets/icons/lang_cn.png", const Locale('zh'), "中文"),
  ]);

  Widget _langBtn(String asset, Locale loc, String label) => GestureDetector(
    onTap: () => widget.onLocaleChange?.call(loc),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.5)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(radius: 11, backgroundImage: AssetImage(asset), backgroundColor: Colors.transparent),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: terminalBlack)),
      ]),
    ),
  );

  Widget _buildSidePillarBlock(AppLocalizations t, bool isLeft, {bool fullWidth = false}) => Container(
    width: fullWidth ? 400 : 300,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey.withOpacity(0.05))),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: isLeft ? [
      _pillarUnit('assets/icons/icon_4.png', t.pillar1Title, t.pillar1Subtitle),
      _divider(),
      _pillarUnit('assets/icons/icon_3.png', t.pillar3Title, t.pillar3Subtitle),
      _divider(),
      _pillarUnit('assets/icons/icon_2.png', t.pillar2Title, t.pillar2Subtitle),
    ] : [
      _pillarUnit('assets/icons/icon_5.png', t.pillar4Title, t.pillar4Subtitle),
      _divider(),
      _pillarUnit('assets/icons/icon_1.png', t.pillar5Title, t.pillar5Subtitle),
      _divider(),
      _pillarUnit('assets/icons/icon_6.png', t.pillar6Title, t.pillar6Subtitle),
    ]),
  );

  Widget _pillarUnit(String iconPath, String head, String fullSub) {
    final parts = fullSub.split('\n');
    return InkWell(
      onTap: _handleVisitorAccess, 
      borderRadius: BorderRadius.circular(12),
      splashColor: goldBase.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Image.asset(iconPath, width: 52, height: 52, errorBuilder: (c,e,s) => const Icon(Icons.token, color: goldBase, size: 40)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(head.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: terminalBlack, letterSpacing: 0.5)),
            if (parts.isNotEmpty) Text(parts[0].toUpperCase(), style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: goldBase)),
            const SizedBox(height: 4),
            if (parts.length > 1) Text(parts[1], style: const TextStyle(fontSize: 10.5, color: bodyGrey, height: 1.4, fontWeight: FontWeight.w400)),
          ])),
        ]),
      ),
    );
  }

  Widget _divider() => Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Divider(color: Colors.grey.withOpacity(0.05), thickness: 1, indent: 68));

  Widget _buildAuthBlock(AppLocalizations t) => Container(
    width: 380,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 40, offset: const Offset(0, 10))], border: Border.all(color: Colors.grey.withOpacity(0.05))),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(_getGreeting(t).toUpperCase(), style: const TextStyle(color: goldBase, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
      const SizedBox(height: 8),
      Text(t.secureAuth.toUpperCase(), style: const TextStyle(color: terminalBlack, fontSize: 17, fontWeight: FontWeight.w900)),
      const SizedBox(height: 35),
      _field(t.email, Icons.alternate_email, _emailController),
      const SizedBox(height: 18),
      _field(t.password, Icons.lock_outline, _passwordController, isPass: true),
      const SizedBox(height: 40),
      _primaryBtn(t.login, _loading ? null : _handleLogin, isLoading: _loading),
      const SizedBox(height: 14),
      _secondaryBtn(t.registerLink, () => Navigator.pushNamed(context, '/register')),
      const SizedBox(height: 12),
      _secondaryBtn(t.continueAsVisitor, _handleVisitorAccess),
      const SizedBox(height: 30),
      _StatusPulseRow(statusText: t.authNodeStandby),
    ]),
  );

  Widget _field(String label, IconData icon, TextEditingController ctrl, {bool isPass = false}) => TextField(
    controller: ctrl,
    obscureText: isPass ? _obscurePassword : false,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: terminalBlack),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: silverBase),
      prefixIcon: Icon(icon, color: goldBase.withOpacity(0.8), size: 20),
      suffixIcon: isPass ? IconButton(icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 18, color: silverBase), onPressed: () => setState(() => _obscurePassword = !_obscurePassword)) : null,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100, width: 2)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase, width: 2)),
    ),
  );

  Widget _primaryBtn(String label, VoidCallback? onTap, {bool isLoading = false}) => Container(
    width: double.infinity, height: 54,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: const LinearGradient(colors: [goldLight, goldBase], begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: goldBase.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))]),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, elevation: 0),
      onPressed: onTap,
      child: isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : Text(label.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14, letterSpacing: 1.0)),
    ),
  );

  Widget _secondaryBtn(String label, VoidCallback onTap) => SizedBox(
    width: double.infinity, height: 50,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onTap,
      child: Text(label.toUpperCase(), style: const TextStyle(color: silverBase, fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: 0.5)),
    ),
  );
}

class _StatusPulseRow extends StatefulWidget {
  final String statusText;
  const _StatusPulseRow({required this.statusText});
  @override
  State<_StatusPulseRow> createState() => _StatusPulseRowState();
}

class _StatusPulseRowState extends State<_StatusPulseRow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
    _opacity = Tween<double>(begin: 0.4, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      FadeTransition(opacity: _opacity, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle))),
      const SizedBox(width: 10),
      Text(widget.statusText.toUpperCase(), style: const TextStyle(fontSize: 10, color: Color(0xFF4CAF50), fontWeight: FontWeight.w900, letterSpacing: 1.0)),
    ]);
  }
}