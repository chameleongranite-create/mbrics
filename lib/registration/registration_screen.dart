import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

class _SideColumn extends StatelessWidget {
  final bool alignRight;
  final List<Widget> children;

  const _SideColumn({required this.alignRight, required this.children, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: children,
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

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
  String _selectedCountry = 'ZA';

  OutlineInputBorder get _roundedBorder =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(12));

  Future<void> _register() async {
    // Validate form first
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

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

        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
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
            );
          },
        );
      }
    } catch (e) {
      final t = AppLocalizations.of(context)!;
      String message;
      final errorText = e.toString().toLowerCase();

      if (errorText.contains('duplicate') ||
          errorText.contains('users_email_key')) {
        message = t.errorEmailTaken;
      } else if (errorText.contains('password')) {
        message = t.errorWeakPassword;
      } else if (errorText.contains('network')) {
        message = t.errorNetwork;
      } else {
        message = t.registrationFailed(t.errorUnexpected);
      }

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.registerTitle),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildFeature(String imagePath, String title, String line1, String line2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF343A40),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  line1,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xFF343A40),
                  ),
                ),
                Text(
                  line2,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xFF343A40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrationCard(AppLocalizations t) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Slogan removed here to avoid duplication; it stays above the card.
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
                    (value == null || value.isEmpty) ? "Name is required" : null,
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
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    items: const [
                      DropdownMenuItem(value: 'ZA', child: Text('South Africa')),
                      DropdownMenuItem(value: 'CN', child: Text('China')),
                      DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                    ],
                    onChanged: (val) =>
                        setState(() => _selectedCountry = val ?? 'ZA'),
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
                        final phoneRegex = RegExp(r'^[0-9]{7,15}$');
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
                    backgroundColor: const Color(0xFFC2994B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(t.createAccount),
                ),
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    const double centerMaxWidth = 420;
    const double sideMaxWidth = 360;
    const double columnGap = 24;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Image.asset('assets/mbrics_logo.png', height: 140),
                  const SizedBox(height: 12),
                  Text(
                    "Built for global trade. Designed for trust.",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA7A9AC),
                      letterSpacing: 0.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmall = constraints.maxWidth < 900;

                      if (isSmall) {
                        // Column: left features -> card -> right features
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    maxWidth: sideMaxWidth),
                                child: _SideColumn(
                                  alignRight: true,
                                  children: [
                                    _buildFeature(
                                      'assets/icons/register_1.png',
                                      "Secure Identity",
                                      "Your details are encrypted end-to-end.",
                                      "No leaks, no compromises.",
                                    ),
                                    _buildFeature(
                                      'assets/icons/register_2.png',
                                      "Global Compliance",
                                      "Meets international KYC/AML standards.",
                                      "Trusted by regulators worldwide.",
                                    ),
                                    _buildFeature(
                                      'assets/icons/register_3.png',
                                      "Instant Verification",
                                      "Accounts verified in seconds.",
                                      "No waiting, no delays.",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    maxWidth: centerMaxWidth),
                                child: _buildRegistrationCard(t),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    maxWidth: sideMaxWidth),
                                child: _SideColumn(
                                  alignRight: false,
                                  children: [
                                    _buildFeature(
                                      'assets/icons/register_4.png',
                                      "Smart Contracts Ready",
                                      "Future-proof onboarding.",
                                      "Seamless integration with blockchain escrow.",
                                    ),
                                    _buildFeature(
                                      'assets/icons/register_5.png',
                                      "Cross-Border Friendly",
                                      "Register once, trade globally.",
                                      "Supports multiple currencies and regions.",
                                    ),
                                    _buildFeature(
                                      'assets/icons/register_6.png',
                                      "Audit Trail Transparency",
                                      "Every registration logged immutably.",
                                      "Proof of trust for partners and investors.",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        // Row: left features | center card | right features
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: sideMaxWidth),
                                  child: _SideColumn(
                                    alignRight: true,
                                    children: [
                                      _buildFeature(
                                        'assets/icons/register_1.png',
                                        "Secure Identity",
                                        "Your details are encrypted end-to-end.",
                                        "No leaks, no compromises.",
                                      ),
                                      _buildFeature(
                                        'assets/icons/register_2.png',
                                        "Global Compliance",
                                        "Meets international KYC/AML standards.",
                                        "Trusted by regulators worldwide.",
                                      ),
                                      _buildFeature(
                                        'assets/icons/register_3.png',
                                        "Instant Verification",
                                        "Accounts verified in seconds.",
                                        "No waiting, no delays.",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: columnGap),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: centerMaxWidth),
                                  child: _buildRegistrationCard(t),
                                ),
                              ),
                            ),
                            const SizedBox(width: columnGap),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: sideMaxWidth),
                                  child: _SideColumn(
                                    alignRight: false,
                                    children: [
                                      _buildFeature(
                                        'assets/icons/register_4.png',
                                        "Smart Contracts Ready",
                                        "Future-proof onboarding.",
                                        "Seamless integration with blockchain escrow.",
                                      ),
                                      _buildFeature(
                                        'assets/icons/register_5.png',
                                        "Cross-Border Friendly",
                                        "Register once, trade globally.",
                                        "Supports multiple currencies and regions.",
                                      ),
                                      _buildFeature(
                                        'assets/icons/register_6.png',
                                        "Audit Trail Transparency",
                                        "Every registration logged immutably.",
                                        "Proof of trust for partners and investors.",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}