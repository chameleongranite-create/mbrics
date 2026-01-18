import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';
import '../theme/mbrics_theme.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;
  const RegistrationScreen({super.key, this.onLocaleChange});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _companyError;
  bool _loading = false;
  bool _isLoginHovered = false;

  // mBrics Brand Palette
  static const Color goldBase = Color(0xFFC2994B);
  static const Color goldLight = Color(0xFFE5C17A);
  static const Color terminalBlack = Color(0xFF1A1A1A);
  static const Color bodyGrey = Color(0xFF757575);
  static const Color silverBase = Color(0xFFA7A9AC);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _companyController.dispose();
    super.dispose();
  }

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
      _showSnackBar(e.message);
    } catch (e) {
      _showSnackBar(t.errorUnexpected);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent, behavior: SnackBarBehavior.floating)
    );
  }

  void _showSuccessDialog() {
    final t = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: const BorderSide(color: goldBase, width: 0.5)),
        title: Column(
          children: [
            const Icon(Icons.verified_user_outlined, color: goldBase, size: 44),
            const SizedBox(height: 15),
            Text(t.registerTitle.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w900, color: terminalBlack, fontSize: 16)),
          ],
        ),
        content: Text(t.registrationSlogan, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.5)),
        actions: [
          Center(
            child: TextButton(
              onPressed: () { Navigator.pop(context); Navigator.pop(context); },
              child: Text(t.backToLogin.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900, color: goldBase, letterSpacing: 1)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    
    // Using the same compact breakpoints as Login
    final bool showThreeCols = size.width > 1050;
    final bool showTwoCols = size.width <= 1050 && size.width > 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Center(
              child: Container(
                constraints: BoxConstraints(minHeight: size.height, maxWidth: 1200),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _logoCore(t),
                    const SizedBox(height: 40),

                    if (showThreeCols)
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch, 
                          children: [
                            _buildSidePillarBlock(t, true), 
                            const SizedBox(width: 12),
                            _buildRegisterCard(t),                   
                            const SizedBox(width: 12),
                            _buildSidePillarBlock(t, false), 
                          ],
                        ),
                      )
                    else if (showTwoCols)
                      Column(
                        children: [
                          _buildRegisterCard(t),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSidePillarBlock(t, true),
                              const SizedBox(width: 12),
                              _buildSidePillarBlock(t, false),
                            ],
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _buildRegisterCard(t),
                          const SizedBox(height: 20),
                          _buildSidePillarBlock(t, true, fullWidth: true),
                          const SizedBox(height: 15),
                          _buildSidePillarBlock(t, false, fullWidth: true),
                        ],
                      ),

                    const SizedBox(height: 50),
                    const Text("SECURED BY mBRICS BLOCKCHAIN ENGINE", 
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: silverBase, letterSpacing: 2.5)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 25, left: 25, child: _langBtn("assets/icons/lang_en.png", const Locale('en'))),
          Positioned(top: 25, right: 25, child: _langBtn("assets/icons/lang_cn.png", const Locale('zh'))),
        ],
      ),
    );
  }

  Widget _logoCore(AppLocalizations t) {
    return Column(
      children: [
        Image.asset('assets/mbrics_logo.png', height: 65),
        const SizedBox(height: 8),
        Text(t.slogan.toUpperCase(), 
          style: const TextStyle(letterSpacing: 3.0, fontSize: 8, color: goldBase, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSidePillarBlock(AppLocalizations t, bool isLeft, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? 380 : 280,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: goldBase.withOpacity(0.12)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 20)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLeft) ...[
            _pillarUnit('assets/icons/icon_4.png', t.pillar1Title, t.pillar1Subtitle), 
            _dividerDot(),
            _pillarUnit('assets/icons/icon_5.png', t.pillar3Title, t.pillar3Subtitle), 
            _dividerDot(),
            _pillarUnit('assets/icons/icon_3.png', t.pillar4Title, t.pillar4Subtitle), 
          ] else ...[
            _pillarUnit('assets/icons/icon_1.png', t.pillar2Title, t.pillar2Subtitle), 
            _dividerDot(),
            _pillarUnit('assets/icons/icon_2.png', t.pillar6Title, t.pillar6Subtitle), 
            _dividerDot(),
            _pillarUnit('assets/icons/icon_6.png', t.pillar5Title, t.pillar5Subtitle), 
          ],
        ],
      ),
    );
  }

  Widget _pillarUnit(String iconPath, String head, String fullSub) {
    final parts = fullSub.split('\n');
    final techLine = parts.isNotEmpty ? parts[0] : "";
    final bodyText = parts.length > 1 ? parts[1] : "";

    return Row(
      children: [
        Container(
          width: 55, height: 55,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: goldBase.withOpacity(0.08))),
          child: ClipOval(child: Image.asset(iconPath, fit: BoxFit.cover)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(head.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: terminalBlack)),
              Text(techLine.toUpperCase(), style: const TextStyle(fontSize: 7.5, fontWeight: FontWeight.bold, color: goldBase)),
              const SizedBox(height: 3),
              Text(bodyText, style: const TextStyle(fontSize: 9, color: bodyGrey, height: 1.2)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dividerDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 65),
          Container(width: 3, height: 3, decoration: const BoxDecoration(color: goldBase, shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _buildRegisterCard(AppLocalizations t) {
    return Container(
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: goldBase.withOpacity(0.1), blurRadius: 30)],
        border: Border.all(color: goldBase.withOpacity(0.15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.joinNetwork.toUpperCase(), style: const TextStyle(color: goldBase, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 4),
          Text(t.register.toUpperCase(), style: const TextStyle(color: terminalBlack, fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(height: 30),
          _field(t.companyName, Icons.business, _companyController, _companyError),
          const SizedBox(height: 20),
          _field(t.email, Icons.alternate_email, _emailController, _emailError),
          const SizedBox(height: 20),
          _field(t.password, Icons.lock_outline, _passwordController, _passwordError, isPass: true),
          const SizedBox(height: 35),
          _metallicBtn(t.createAccount, _loading ? null : _validateAndRegister, isLoading: _loading),
          const SizedBox(height: 25),
          _StatusPulseRow(statusText: t.authNodeStandby),
          const SizedBox(height: 25),
          _loginLink(t),
        ],
      ),
    );
  }

  Widget _field(String label, IconData icon, TextEditingController ctrl, String? error, {bool isPass = false}) {
    return TextField(
      controller: ctrl,
      obscureText: isPass,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: terminalBlack),
      decoration: InputDecoration(
        labelText: label,
        errorText: error,
        errorStyle: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.redAccent),
        labelStyle: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: silverBase),
        prefixIcon: Icon(icon, color: goldBase, size: 18),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase)),
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
      ),
    );
  }

  Widget _metallicBtn(String label, VoidCallback? onTap, {bool isLoading = false}) {
    return Container(
      width: double.infinity, height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
        gradient: const LinearGradient(colors: [goldLight, goldBase]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
        onPressed: onTap, 
        child: isLoading 
          ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Text(label.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13)),
      ),
    );
  }

  Widget _loginLink(AppLocalizations t) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Text(t.alreadyHaveAccount, textAlign: TextAlign.center,
        style: const TextStyle(color: silverBase, fontSize: 10.5, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
    );
  }

  Widget _langBtn(String asset, Locale loc) {
    return GestureDetector(
      onTap: () => widget.onLocaleChange?.call(loc),
      child: CircleAvatar(radius: 20, backgroundImage: AssetImage(asset), backgroundColor: Colors.transparent),
    );
  }
}

class _StatusPulseRow extends StatefulWidget {
  final String statusText;
  const _StatusPulseRow({required this.statusText});
  @override
  State<_StatusPulseRow> createState() => _StatusPulseRowState();
}

class _StatusPulseRowState extends State<_StatusPulseRow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      FadeTransition(opacity: _opacityAnimation, child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle))),
      const SizedBox(width: 8),
      Text(widget.statusText.toUpperCase(), style: const TextStyle(fontSize: 8.5, color: Color(0xFF4CAF50), fontWeight: FontWeight.bold)),
    ]);
  }
}