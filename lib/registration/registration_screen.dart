import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;
  const RegistrationScreen({super.key, this.onLocaleChange});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // 1. STATE & CONTROLLERS
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _companyError;
  bool _loading = false;
  bool _obscurePassword = true;

  // REFINED BRAND COLORS - Synced with Login for brand consistency
  static const Color goldBase = Color(0xFFC2994B);
  static const Color goldLight = Color(0xFFE5C17A);
  static const Color terminalBlack = Color(0xFF1A1A1A);
  static const Color bodyGrey = Color(0xFF5F6368);   
  static const Color silverBase = Color(0xFF70757A); 

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  // 2. LOGIC & SUCCESS POPUP
  void _validateAndRegister() async {
    final t = AppLocalizations.of(context)!;
    setState(() {
      _emailError = _emailController.text.isEmpty ? t.errorEmailRequired : null;
      _passwordError = _passwordController.text.length < 8 ? t.errorPasswordTooShort : null;
      _companyError = _companyController.text.isEmpty ? t.errorCompanyNameRequired : null;
    });

    if (_emailError == null && _passwordError == null && _companyError == null) {
      _handleRegister();
    }
  }

  Future<void> _handleRegister() async {
    final t = AppLocalizations.of(context)!;
    setState(() => _loading = true);
    try {
      await Supabase.instance.client.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {'company': _companyController.text.trim()},
      );
      if (mounted) _showSuccessDialog();
    } on AuthException catch (e) {
      String message = e.message;
      final lowMsg = e.message.toLowerCase();
      if (lowMsg.contains("already registered") || lowMsg.contains("already exists")) {
        message = t.errorUserExists;
      } else if (lowMsg.contains("weak password")) {
        message = t.errorWeakPassword;
      } else if (e.statusCode == '429') {
        message = t.errorTooManyRequests;
      }
      _showSnackBar(message);
    } catch (e) {
      _showSnackBar(t.errorUnexpected);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)), 
        backgroundColor: Colors.redAccent, 
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )
    );
  }

  void _showSuccessDialog() {
    final t = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Column(
          children: [
            const Icon(Icons.check_circle_outline, color: goldBase, size: 54),
            const SizedBox(height: 15),
            Text(t.registerSuccessTitle, 
              textAlign: TextAlign.center, 
              style: const TextStyle(fontWeight: FontWeight.w900, color: terminalBlack, fontSize: 18)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(t.registerSuccessMsg, 
              textAlign: TextAlign.center, 
              style: const TextStyle(color: bodyGrey, fontSize: 14, height: 1.5)),
            const SizedBox(height: 20),
            Text(t.registerDemoNote,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: goldBase, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () { 
                Navigator.pop(context); 
                Navigator.pop(context); 
              },
              child: Text(t.startNow.toUpperCase(), 
                style: const TextStyle(fontWeight: FontWeight.w900, color: goldBase, letterSpacing: 1.5)),
            ),
          )
        ],
      ),
    );
  }

  // 3. MAIN UI
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
                            _buildRegisterCard(t),                   
                            const SizedBox(width: 20),
                            Flexible(child: _buildSidePillarBlock(t, false)), 
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          _buildRegisterCard(t),
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
                    Text("SECURED BY mBrics WEB3 ENGINE", 
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: silverBase.withOpacity(0.6), letterSpacing: 3.0)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 4. COMPONENTS
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children: isLeft ? [
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
      ]
    ),
  );

  Widget _pillarUnit(String iconPath, String head, String fullSub) {
    final parts = fullSub.split('\n');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Image.asset(iconPath, width: 52, height: 52),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(head.toUpperCase(), 
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: terminalBlack, letterSpacing: 0.5)),
              if (parts.isNotEmpty) 
                Text(parts[0].toUpperCase(), 
                  style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: goldBase)),
              const SizedBox(height: 6),
              if (parts.length > 1) 
                Text(parts[1], 
                  style: const TextStyle(fontSize: 11.5, color: bodyGrey, height: 1.4, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12), 
    child: Divider(color: Colors.grey.withOpacity(0.05), thickness: 1, indent: 68)
  );

  Widget _buildRegisterCard(AppLocalizations t) => Container(
    width: 380,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: BorderRadius.circular(32), 
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 40, offset: const Offset(0, 10))], 
      border: Border.all(color: Colors.grey.withOpacity(0.05))
    ),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(t.joinNetwork.toUpperCase(), style: const TextStyle(color: goldBase, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
      const SizedBox(height: 8),
      Text(t.register.toUpperCase(), style: const TextStyle(color: terminalBlack, fontSize: 17, fontWeight: FontWeight.w900)),
      const SizedBox(height: 35),
      _field(t.companyName, Icons.business, _companyController, _companyError),
      const SizedBox(height: 18),
      _field(t.email, Icons.alternate_email, _emailController, _emailError),
      const SizedBox(height: 18),
      _field(t.password, Icons.lock_outline, _passwordController, _passwordError, isPass: true),
      const SizedBox(height: 40),
      _primaryBtn(t.createAccount, _loading ? null : _validateAndRegister, isLoading: _loading),
      const SizedBox(height: 14),
      _secondaryBtn(t.alreadyHaveAccount, () => Navigator.pop(context)),
      const SizedBox(height: 30),
      _StatusPulseRow(statusText: t.authNodeStandby),
    ]),
  );

  Widget _field(String label, IconData icon, TextEditingController ctrl, String? error, {bool isPass = false}) => TextField(
    controller: ctrl,
    obscureText: isPass ? _obscurePassword : false,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: terminalBlack),
    decoration: InputDecoration(
      labelText: label,
      errorText: error,
      errorStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      labelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: silverBase),
      prefixIcon: Icon(icon, color: goldBase.withOpacity(0.8), size: 20),
      suffixIcon: isPass ? IconButton(icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 18, color: silverBase), onPressed: () => setState(() => _obscurePassword = !_obscurePassword)) : null,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100, width: 2)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase, width: 2)),
    ),
  );

  Widget _primaryBtn(String label, VoidCallback? onTap, {bool isLoading = false}) => Container(
    width: double.infinity, height: 54,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), 
      gradient: const LinearGradient(colors: [goldLight, goldBase], begin: Alignment.topLeft, end: Alignment.bottomRight), 
      boxShadow: [BoxShadow(color: goldBase.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))]
    ),
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
    return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
      FadeTransition(opacity: _opacity, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle))),
      const SizedBox(width: 10),
      Flexible(child: Text(widget.statusText.toUpperCase(), style: const TextStyle(fontSize: 10, color: Color(0xFF4CAF50), fontWeight: FontWeight.w900, letterSpacing: 1.0))),
    ]);
  }
}