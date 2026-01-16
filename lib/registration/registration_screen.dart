import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart'; 
import '../layout/master_layout.dart';

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
  bool _loading = false;
  bool _formSubmitted = false;
  bool _isLoginHovered = false; 

  static const Color goldBase = Color(0xFFC2994B);
  static const Color goldLight = Color(0xFFE5C17A);
  static const Color silverBase = Color(0xFFA7A9AC);
  static const Color terminalBlack = Color(0xFF121212);

  // --- LOGIC & VALIDATION ---
  String? _validateRequired(String? value, String errorMsg) {
    if (value == null || value.isEmpty) return errorMsg;
    return null;
  }

  String? _validateEmail(String? value, AppLocalizations t) {
    if (value == null || value.isEmpty) return t.errorEmailRequired;
    if (!RegExp(r'^[\w-\.\+]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return t.errorInvalidEmailFormat;
    return null;
  }

  Future<void> _handleRegister() async {
    final t = AppLocalizations.of(context)!;
    final isChinese = Localizations.localeOf(context).languageCode == 'zh';
    setState(() => _formSubmitted = true);

    if (_validateRequired(_companyController.text, isChinese ? "请填写公司名称" : "Company name required") != null ||
        _validateEmail(_emailController.text, t) != null ||
        _validateRequired(_passwordController.text, t.errorPasswordRequired) != null) return;

    setState(() => _loading = true);
    try {
      await Supabase.instance.client.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {
          'company': _companyController.text.trim(),
          'language': Localizations.localeOf(context).languageCode,
        },
      );
      
      if (mounted) _showSuccessDialog(isChinese);
    } on AuthException catch (e) {
      _showSnackBar(e.message);
    } catch (e) {
      _showSnackBar(t.errorUnexpected);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Column(
                    children: [
                      Image.asset('assets/mbrics_logo.png', height: 90),
                      const SizedBox(height: 8),
                      Text(t.slogan.toUpperCase(), 
                        style: const TextStyle(fontFamily: 'Inter', letterSpacing: 3, fontSize: 10, color: goldBase, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 1150) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 270, child: _pillarColumn(t, true)),
                                const SizedBox(width: 40),
                                _buildRegisterCard(t),
                                const SizedBox(width: 40),
                                SizedBox(width: 270, child: _pillarColumn(t, false)),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                _buildRegisterCard(t),
                                const SizedBox(height: 50),
                                Wrap(spacing: 30, runSpacing: 30, alignment: WrapAlignment.center, children: _allFeatures(t)),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(top: 20, left: 30, child: _langMedallion("EN", "assets/icons/lang_en.png", const Locale('en'), currentLocale.languageCode.startsWith('en'))),
            Positioned(top: 20, right: 30, child: _langMedallion("ZH", "assets/icons/lang_cn.png", const Locale('zh'), currentLocale.languageCode.startsWith('zh'))),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterCard(AppLocalizations t) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: goldBase.withOpacity(0.08), blurRadius: 40, offset: const Offset(0, 10))],
        border: Border.all(color: goldBase.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text(t.joinNetwork.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', color: goldBase, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)),
          const SizedBox(height: 8),
          Text(t.register.toLowerCase(), style: const TextStyle(fontFamily: 'Inter', color: terminalBlack, fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 30),
          _buildField(_companyController, t.companyName, Icons.business_outlined, errorText: _formSubmitted ? _validateRequired(_companyController.text, "Required") : null),
          const SizedBox(height: 15),
          _buildField(_emailController, t.email, Icons.alternate_email, errorText: _formSubmitted ? _validateEmail(_emailController.text, t) : null),
          const SizedBox(height: 15),
          _buildField(_passwordController, t.password, Icons.lock_outline, isPass: true, errorText: _formSubmitted ? _validateRequired(_passwordController.text, t.errorPasswordRequired) : null),
          const SizedBox(height: 35),
          _metallicBtn(t.createAccount, _loading ? null : _handleRegister, isLoading: _loading),
          const SizedBox(height: 25),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _isLoginHovered = true),
            onExit: (_) => setState(() => _isLoginHovered = false),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(t.backToLogin, style: TextStyle(fontFamily: 'Inter', color: _isLoginHovered ? goldBase : silverBase, fontSize: 11, fontWeight: FontWeight.w600, decoration: TextDecoration.underline)),
            ),
          ),
          const SizedBox(height: 20),
          _StatusPulseRow(statusText: t.authNodeStandby),
        ],
      ),
    );
  }

  Widget _pillarColumn(AppLocalizations t, bool isLeft) {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
    return Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: alignRight ? [
      Expanded(child: _featText(title, l1, l2, CrossAxisAlignment.end)), const SizedBox(width: 15), Image.asset(path, width: 50, height: 50),
    ] : [
      Image.asset(path, width: 50, height: 50), const SizedBox(width: 15), Expanded(child: _featText(title, l1, l2, CrossAxisAlignment.start)),
    ]));
  }

  Widget _featText(String title, String l1, String l2, CrossAxisAlignment alignment) {
    return Column(crossAxisAlignment: alignment, children: [
      Text(title, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 13, color: terminalBlack)),
      Text(l1, style: const TextStyle(fontFamily: 'Inter', fontSize: 11, color: goldBase, fontWeight: FontWeight.bold)),
      const SizedBox(height: 2),
      Text(l2, textAlign: alignment == CrossAxisAlignment.end ? TextAlign.right : TextAlign.left, style: const TextStyle(fontFamily: 'Inter', fontSize: 10, color: silverBase, height: 1.2)),
    ]);
  }

  Widget _buildField(TextEditingController ctrl, String label, IconData icon, {bool isPass = false, String? errorText}) {
    return TextField(
      controller: ctrl, 
      obscureText: isPass, 
      style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
      decoration: InputDecoration(
        labelText: label, 
        errorText: errorText, 
        errorStyle: const TextStyle(fontSize: 9), 
        labelStyle: const TextStyle(fontFamily: 'Inter', color: silverBase, fontSize: 10, fontWeight: FontWeight.bold), 
        prefixIcon: Icon(icon, color: goldBase, size: 18), 
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200)), 
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: goldBase, width: 2))
      )
    );
  }

  Widget _metallicBtn(String label, VoidCallback? onTap, {bool isLoading = false}) {
    return Container(width: double.infinity, height: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: const LinearGradient(colors: [goldLight, goldBase], begin: Alignment.topCenter, end: Alignment.bottomCenter), boxShadow: [BoxShadow(color: goldBase.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]),
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent), onPressed: onTap, child: isLoading ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : Text(label, style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14))));
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
              border: Border.all(color: isActive ? goldBase : Colors.grey.shade200, width: isActive ? 2 : 1)
            ), 
            child: ClipOval(child: Image.asset(asset, fit: BoxFit.cover))
          ), 
          const SizedBox(height: 4), 
          Text(label, style: TextStyle(fontFamily: 'Inter', color: isActive ? goldBase : silverBase, fontSize: 9, fontWeight: FontWeight.w900))
        ]
      )
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.redAccent, behavior: SnackBarBehavior.floating));
  }

  void _showSuccessDialog(bool isChinese) {
    showDialog(
      context: context, 
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: const BorderSide(color: goldBase, width: 0.5)), 
        title: Column(
          children: [
            const Icon(Icons.mark_email_read_outlined, color: goldBase, size: 44),
            const SizedBox(height: 15),
            Text(isChinese ? "欢迎加入 mBrics" : "Welcome to mBrics", 
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, color: terminalBlack)),
          ],
        ), 
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isChinese 
                ? "您的贸易账户已创建。请点击我们发给您的邮件中的链接，以激活您的 Web3 引擎访问权限。" 
                : "Your trade account has been created. To activate your access to the Web3 Engine, please click the link in the email we just sent you.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 13, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: goldBase.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isChinese 
                  ? "提示：若 2 分钟内未收到邮件，请检查您的垃圾邮件文件夹。" 
                  : "Tip: If you don't see the email within 2 minutes, please check your spam or junk folder.",
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 11, color: goldBase, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ), 
        actions: [
          Center(
            child: TextButton(
              onPressed: () { Navigator.pop(context); Navigator.pop(context); }, 
              child: Text(isChinese ? "返回登录" : "RETURN TO LOGIN", 
                style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, color: goldBase, letterSpacing: 1))
            ),
          )
        ]
      )
    );
  }
}

class _StatusPulseRow extends StatelessWidget {
  final String statusText;
  const _StatusPulseRow({required this.statusText});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Container(
          width: 6, 
          height: 6, 
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50), 
            shape: BoxShape.circle
          )
        ), 
        const SizedBox(width: 8), 
        Text(
          statusText, 
          style: const TextStyle(
            fontFamily: 'ShareTechMono',
            fontSize: 10, 
            color: Color(0xFF4CAF50)
          )
        ),
      ]
    );
  }
}