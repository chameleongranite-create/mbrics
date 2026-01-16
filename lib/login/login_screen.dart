import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../layout/master_layout.dart';
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
  bool _loading = false;
  bool _isRegisterHovered = false;

  // mBrics Design Palette
  static const Color goldBase = Color(0xFFC2994B);
  static const Color goldLight = Color(0xFFE5C17A);
  static const Color silverBase = Color(0xFFA7A9AC);
  static const Color terminalBlack = Color(0xFF121212);

  // --- LOGIC: Dynamic Greeting based on Time ---
  String _getGreeting(AppLocalizations t) {
    final hour = DateTime.now().hour;
    if (hour < 12) return t.greetingMorning;
    if (hour < 17) return t.greetingAfternoon;
    return t.greetingEvening;
  }

  // --- LOGIC: Authentication ---
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
      if (mounted) Navigator.pushReplacementNamed(context, '/main_menu');
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

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth <= 1150;

            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1300),
                      child: Column(
                        children: [
                          // FIX: On Mobile, show language icons here to stop flickering
                          if (isMobile)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _langMedallion("EN", "assets/icons/lang_en.png", const Locale('en'), currentLocale.languageCode.startsWith('en')),
                                  const SizedBox(width: 40),
                                  _langMedallion("ZH", "assets/icons/lang_cn.png", const Locale('zh'), currentLocale.languageCode.startsWith('zh')),
                                ],
                              ),
                            ),

                          Image.asset('assets/mbrics_logo.png', height: 90),
                          const SizedBox(height: 8),
                          Text(t.slogan.toUpperCase(), 
                            style: const TextStyle(fontFamily: 'Inter', letterSpacing: 3, fontSize: 10, color: goldBase, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 30),

                          if (!isMobile)
                            // Desktop View
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 270, child: _pillarColumn(t, true)),
                                const SizedBox(width: 40),
                                _buildLoginCard(t),
                                const SizedBox(width: 40),
                                SizedBox(width: 270, child: _pillarColumn(t, false)),
                              ],
                            )
                          else
                            // Mobile View
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  _buildLoginCard(t),
                                  const SizedBox(height: 50),
                                  Wrap(
                                    spacing: 30, runSpacing: 30,
                                    alignment: WrapAlignment.center,
                                    children: _allFeatures(t),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Only show Positioned medallions on Desktop (no scroll conflict)
                if (!isMobile) ...[
                  Positioned(
                    top: 20, left: 30,
                    child: _langMedallion("EN", "assets/icons/lang_en.png", const Locale('en'), currentLocale.languageCode.startsWith('en')),
                  ),
                  Positioned(
                    top: 20, right: 30,
                    child: _langMedallion("ZH", "assets/icons/lang_cn.png", const Locale('zh'), currentLocale.languageCode.startsWith('zh')),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  // --- ALL HELPER METHODS (EXACTLY AS YOUR CODE) ---

  Widget _buildLoginCard(AppLocalizations t) {
    return Container(
      width: 400,
      constraints: const BoxConstraints(maxWidth: 400), // Added to ensure it doesn't break mobile
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: goldBase.withOpacity(0.08), blurRadius: 40, offset: const Offset(0, 10))],
        border: Border.all(color: goldBase.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text(_getGreeting(t).toUpperCase(), 
            style: const TextStyle(fontFamily: 'Inter', color: goldBase, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)),
          const SizedBox(height: 8),
          Text(t.secureAuth, 
            style: const TextStyle(fontFamily: 'Inter', color: terminalBlack, fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 30),
          _buildField(_emailController, t.email, Icons.alternate_email),
          const SizedBox(height: 20),
          _buildField(_passwordController, t.password, Icons.lock_outline, isPass: true),
          const SizedBox(height: 35),
          _metallicBtn(t.login, _loading ? null : _handleLogin, isLoading: _loading),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/register'),
            child: Text(
              t.noAccount,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: silverBase, 
                fontSize: 11, 
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _StatusPulseRow(statusText: t.authNodeStandby),
        ],
      ),
    );
  }

  Widget _pillarColumn(AppLocalizations t, bool isLeft) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: isLeft ? [
        _buildFeature('assets/icons/icon_1.png', t.feature1Title, t.feature1Line1, t.feature1Line2, true),
        _buildFeature('assets/icons/icon_3.png', t.feature3Title, t.feature3Line1, t.feature3Line2, true),
        _buildFeature('assets/icons/icon_4.png', t.feature4Title, t.feature4Line1, t.feature4Line2, true),
      ] : [
        _buildFeature('assets/icons/icon_5.png', t.feature5Title, t.feature5Line1, t.feature5Line2, false),
        _buildFeature('assets/icons/icon_2.png', t.feature2Title, t.feature2Line1, t.feature2Line2, false),
        _buildFeature('assets/icons/icon_6.png', t.feature6Title, t.feature6Line1, t.feature6Line2, false),
      ],
    );
  }

  List<Widget> _allFeatures(AppLocalizations t) {
    return [
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_1.png', t.feature1Title, t.feature1Line1, t.feature1Line2, false)),
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_3.png', t.feature3Title, t.feature3Line1, t.feature3Line2, false)),
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_4.png', t.feature4Title, t.feature4Line1, t.feature4Line2, false)),
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_5.png', t.feature5Title, t.feature5Line1, t.feature5Line2, false)),
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_2.png', t.feature2Title, t.feature2Line1, t.feature2Line2, false)),
      SizedBox(width: 300, child: _buildFeature('assets/icons/icon_6.png', t.feature6Title, t.feature6Line1, t.feature6Line2, false)),
    ];
  }

  Widget _buildFeature(String path, String title, String l1, String l2, bool alignRight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: alignRight ? [
          Expanded(child: _featText(title, l1, l2, CrossAxisAlignment.end)),
          const SizedBox(width: 15),
          _featIcon(path),
        ] : [
          _featIcon(path),
          const SizedBox(width: 15),
          Expanded(child: _featText(title, l1, l2, CrossAxisAlignment.start)),
        ],
      ),
    );
  }

  Widget _featText(String title, String l1, String l2, CrossAxisAlignment alignment) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 13, color: terminalBlack)),
        Text(l1, style: const TextStyle(fontFamily: 'Inter', fontSize: 11, color: goldBase, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(l2, textAlign: alignment == CrossAxisAlignment.end ? TextAlign.right : TextAlign.left, 
          style: const TextStyle(fontFamily: 'Inter', fontSize: 10, color: Colors.grey, height: 1.2)),
        const SizedBox(height: 4),
        const Text("COMING SOON", style: TextStyle(fontFamily: 'Inter', fontSize: 8, color: goldBase, fontWeight: FontWeight.bold, letterSpacing: 1)),
      ],
    );
  }

  Widget _featIcon(String path) => Container(
    width: 50, height: 50,
    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: goldBase, width: 2)),
    child: ClipOval(child: Image.asset(path, fit: BoxFit.cover)),
  );

  Widget _buildField(TextEditingController ctrl, String label, IconData icon, {bool isPass = false}) {
    return TextField(
      controller: ctrl,
      obscureText: isPass,
      style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontFamily: 'Inter', color: silverBase, fontSize: 10, fontWeight: FontWeight.bold),
        prefixIcon: Icon(icon, color: goldBase, size: 18),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase, width: 2)),
      ),
    );
  }

  Widget _metallicBtn(String label, VoidCallback? onTap, {bool isLoading = false}) {
    return Container(
      width: double.infinity, height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(colors: [goldLight, goldBase], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
        onPressed: onTap, 
        child: isLoading 
          ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Text(label, style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
      ),
    );
  }

  Widget _langMedallion(String label, String asset, Locale loc, bool isActive) {
    return GestureDetector(
      onTap: () => widget.onLocaleChange?.call(loc),
      child: Column(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              border: Border.all(color: isActive ? goldBase : Colors.grey.shade200, width: isActive ? 2 : 1),
            ),
            child: ClipOval(child: Image.asset(asset, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontFamily: 'Inter', color: isActive ? goldBase : silverBase, fontSize: 9, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

class _StatusPulseRow extends StatelessWidget {
  final String statusText;
  const _StatusPulseRow({required this.statusText});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle)),
      const SizedBox(width: 8),
      Text(statusText, style: const TextStyle(fontFamily: 'ShareTechMono', fontSize: 10, color: Color(0xFF4CAF50))),
    ]);
  }
}