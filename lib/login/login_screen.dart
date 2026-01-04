// lib/login/login_screen.dart
import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // ✅ Supabase SDK

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onLocaleChange});
  final void Function(Locale) onLocaleChange;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(); // ✅ use email instead of username
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login() async {
    final supabase = Supabase.instance.client;
    final t = AppLocalizations.of(context)!;

    try {
      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

     if (response.session != null) {
  // ✅ Navigate straight to Main Menu after successful login
  Navigator.pushReplacementNamed(context, '/mainmenu');
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(t.invalidCredentials),
      backgroundColor: Colors.redAccent,
    ),
  );
}
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _toggleLang() {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange(const Locale('zh'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600 ? screenWidth - 32 : 420.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black),
            onPressed: _toggleLang,
            tooltip: t.toggleLang,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 220,
                maxWidth: 320,
              ),
              child: Image.asset(
                'assets/mbrics_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: cardWidth,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        t.loginTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: t.email,
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: t.password,
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _login,
                          icon: const Icon(Icons.login),
                          label: Text(
                            t.loginBtn,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: Text(t.noAccountRegister),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}