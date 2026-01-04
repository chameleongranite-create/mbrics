// lib/registration/registration_screen.dart
import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // ✅ Supabase SDK

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required this.onLocaleChange});
  final void Function(Locale) onLocaleChange;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  bool _obscurePassword = true;

  OutlineInputBorder get _roundedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      );

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final supabase = Supabase.instance.client;
      final t = AppLocalizations.of(context)!;

      try {
        // Step 1: Sign up with Supabase Auth
        final response = await supabase.auth.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          emailRedirectTo: 'http://localhost:5442', // 👈 match your Flutter dev server
        );

        // 👇 Debug print to check UID
        print('Supabase UID: ${response.user?.id}');
        
// 👇 Debug print to check UID
print('Supabase UID: ${response.user?.id}');

        final userId = response.user?.id;
        if (userId != null) {
          // Step 2: Insert profile row into public.users
          await supabase.from('users').insert({
            'id': userId,
            'full_name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'phone': _phoneController.text.trim(),
            'company': _companyController.text.trim(),
          });

          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(t.registerTitle),
              content: Text(t.registrationSuccess),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(t.loginBtn),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(t.registerTitle),
            content: Text('Registration failed: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            t.registerTitle,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: t.fullName,
                              prefixIcon: const Icon(Icons.person),
                              border: _roundedBorder,
                            ),
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? "Name is required"
                                    : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: t.email,
                              prefixIcon: const Icon(Icons.email),
                              border: _roundedBorder,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              final emailRegex =
                                  RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                              if (!emailRegex.hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: t.password,
                              prefixIcon: const Icon(Icons.lock),
                              border: _roundedBorder,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 8) {
                                return "Use at least 8 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: t.phoneOptional,
                              prefixIcon: const Icon(Icons.phone),
                              border: _roundedBorder,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _companyController,
                            decoration: InputDecoration(
                              labelText: t.companyOptional,
                              prefixIcon: const Icon(Icons.business),
                              border: _roundedBorder,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _register,
                              child: Text(
                                t.createAccount,
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
                                Navigator.pushNamed(context, '/login'),
                            child: Text(t.goToLogin),
                          ),
                        ],
                      ),
                    ),
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