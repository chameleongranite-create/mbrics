import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

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
  final _otherCodeController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;
  String _selectedCountry = 'ZA'; // Default South Africa

  OutlineInputBorder get _roundedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      );

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    final supabase = Supabase.instance.client;
    final t = AppLocalizations.of(context)!;

    setState(() => _isLoading = true);

    try {
      final response = await supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        emailRedirectTo: 'http://localhost:5442',
      );

      final userId = response.user?.id;
      if (userId != null) {
        String phoneNumber = _phoneController.text.trim();
        if (_selectedCountry == 'ZA') {
          phoneNumber = '+27 $phoneNumber';
        } else if (_selectedCountry == 'CN') {
          phoneNumber = '+86 $phoneNumber';
        } else if (_otherCodeController.text.isNotEmpty) {
          phoneNumber = '${_otherCodeController.text.trim()} $phoneNumber';
        }

        await supabase.from('users').insert({
          'id': userId,
          'full_name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'phone': phoneNumber,
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
      final errorMsg = e.toString();
      String message;
      if (errorMsg.contains('duplicate key value') || errorMsg.contains('users_email_key')) {
        message = t.errorEmailTaken;
      } else if (errorMsg.contains('Password')) {
        message = t.errorWeakPassword;
      } else if (errorMsg.contains('Network')) {
        message = t.errorNetwork;
      } else {
        message = t.registrationFailed(errorMsg);
      }

      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t.registerTitle),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600 ? screenWidth - 32 : 420.0;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/mbrics_logo.png', height: 120),
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
                                isDense: true,
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
                                isDense: true,
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
                                  return t.errorInvalidEmailFormat;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: t.password,
                                prefixIcon: const Icon(Icons.lock),
                                border: _roundedBorder,
                                helperText: "Password must be at least 8 characters",
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
                                  return t.errorWeakPassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Country + Phone block (fixed layout)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DropdownButtonFormField<String>(
                                  value: _selectedCountry,
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'ZA',
                                        child: Text('🇿🇦 South Africa')),
                                    DropdownMenuItem(
                                        value: 'CN',
                                        child: Text('🇨🇳 China')),
                                    DropdownMenuItem(
                                        value: 'OTHER',
                                        child: Text('🌍 Other')),
                                  ],
                                  onChanged: (val) => setState(
                                      () => _selectedCountry = val ?? 'ZA'),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: "Country",
                                    border: _roundedBorder,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: t.phoneOptional,
                                    prefixIcon: const Icon(Icons.phone),
                                    border: _roundedBorder,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      final phoneRegex =
                                          RegExp(r'^[0-9]{7,15}$');
                                      if (!phoneRegex.hasMatch(value)) {
                                        return t.errorInvalidPhone;
                                      }
                                    }
                                    return null;
                                  },
                                ),
                                if (_selectedCountry == 'OTHER') ...[
                                  const SizedBox(height: 12),
                                  TextFormField(
                                    controller: _otherCodeController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: "Country Code (e.g. +44)",
                                      border: _roundedBorder,
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 16),

                            TextFormField(
                              controller: _companyController,
                              decoration: InputDecoration(
                                isDense: true,
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
                                  backgroundColor: const Color(0xFF3B5998),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14),
                                  textStyle:
                                      const TextStyle(fontSize: 16),
                                ),
                                onPressed: _isLoading ? null : _register,
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text(t.createAccount),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Link to login
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: Text(
                                t.alreadyRegistered,
                                style: const TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}