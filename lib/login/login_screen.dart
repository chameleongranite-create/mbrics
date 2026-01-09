import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../layout/master_layout.dart';
import '../l10n/app_localizations.dart';

/// Simple side column that lists feature items with alignment control.
class _SideColumn extends StatelessWidget {
  final bool alignRight;
  final List<Widget> children;

  const _SideColumn({required this.alignRight, required this.children});

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
  String? _errorMessage;

  // Key to measure or anchor the login card (no direct size reads in build).
  final GlobalKey _loginCardKey = GlobalKey();

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/profile');
        }
      } else {
        setState(() {
          _errorMessage = "Login failed. Please check your credentials.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    const Color backgroundWhite = Color(0xFFFFFFFF);
    const Color cardTint = Color(0xFFFAFAFA);
    const Color borderGray = Color(0xFFE0E0E0);
    const Color silver = Color(0xFFA7A9AC);
    const Color gold = Color(0xFFC2994B);
    const Color textDark = Color(0xFF343A40);

    const double centerMaxWidth = 420;
    const double sideMaxWidth = 360;
    const double columnGap = 24;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Container(
        color: backgroundWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Image.asset('assets/mbrics_logo.png', height: 100),
              const SizedBox(height: 12),
              Text(
  "Global trade, secured by blockchain",
  style: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: silver,
  ),
  textAlign: TextAlign.center,
),
              Text(
                "数字货币桥平台",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: silver,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Responsive layout: Column on small screens, Row on large
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxWidth < 900;

                  if (isSmall) {
                    // Stack vertically for small screens
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // LEFT SIDE
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: sideMaxWidth),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: _SideColumn(
                              alignRight: true,
                              children: [
                                _buildFeature(
                                  Icons.currency_exchange,
                                  "Trade in Local Currency",
                                  "Real-time quotes in Rand, Yuan, and more.",
                                  "Transparent landed costs, no hidden conversions.",
                                ),
                                _buildFeature(
                                  Icons.public,
                                  "Instant International Transfers",
                                  "Instant money transfers in your currency.",
                                  "Backed by central banks for safety.",
                                ),
                                _buildFeature(
                                  Icons.lock,
                                  "Blockchain Escrow — Policed",
                                  "Smart contracts enforce trust automatically.",
                                  "All transactions policed by blockchain oversight.",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // CENTER LOGIN BLOCK
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: centerMaxWidth),
                          child: _buildLoginCard(
                            t,
                            silver,
                            gold,
                            backgroundWhite,
                            borderGray,
                            cardTint,
                            textDark,
                            key: _loginCardKey,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // RIGHT SIDE
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: sideMaxWidth),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _SideColumn(
                              alignRight: false,
                              children: [
                                _buildFeature(
                                  Icons.local_shipping,
                                  "Trusted Logistics",
                                  "Delivered by Global 500 providers.",
                                  "State-owned carriers ensure reliability.",
                                ),
                                _buildFeature(
                                  Icons.shield,
                                  "Oversight & Security",
                                  "Overseen by the Bank of China.",
                                  "The watchdog of global trade.",
                                ),
                                _buildFeature(
                                  Icons.description,
                                  "No More Costly L/Cs",
                                  "Replace slow Letters of Credit.",
                                  "Instant agreements, zero paperwork.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  // Horizontal row for large screens
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // LEFT SIDE
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: sideMaxWidth),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: _SideColumn(
                            alignRight: true,
                            children: [
                              _buildFeature(
                                Icons.currency_exchange,
                                "Trade in Local Currency",
                                "Real-time quotes in Rand, Yuan, and more.",
                                "Transparent landed costs, no hidden conversions.",
                              ),
                              _buildFeature(
                                Icons.public,
                                "Instant International Transfers",
                                "Instant money transfers in your currency.",
                                "Backed by central banks for safety.",
                              ),
                              _buildFeature(
                                Icons.lock,
                                "Blockchain Escrow — Policed",
                                "Smart contracts enforce trust automatically.",
                                "All transactions policed by blockchain oversight.",
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: columnGap),

                      // CENTER LOGIN BLOCK
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: centerMaxWidth),
                        child: _buildLoginCard(
                          t,
                          silver,
                          gold,
                          backgroundWhite,
                          borderGray,
                          cardTint,
                          textDark,
                          key: _loginCardKey,
                        ),
                      ),

                      const SizedBox(width: columnGap),

                      // RIGHT SIDE
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: sideMaxWidth),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _SideColumn(
                            alignRight: false,
                            children: [
                              _buildFeature(
                                Icons.local_shipping,
                                "Trusted Logistics",
                                "Delivered by Global 500 providers.",
                                "State-owned carriers ensure reliability.",
                              ),
                              _buildFeature(
                                Icons.shield,
                                "Oversight & Security",
                                "Overseen by the Bank of China.",
                                "The watchdog of global trade.",
                              ),
                              _buildFeature(
                                Icons.description,
                                "No More Costly L/Cs",
                                "Replace slow Letters of Credit.",
                                "Instant agreements, zero paperwork.",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(
    IconData icon,
    String title,
    String line1,
    String line2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC2994B), size: 28),
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

  Widget _buildLoginCard(
    AppLocalizations t,
    Color silver,
    Color gold,
    Color backgroundWhite,
    Color borderGray,
    Color cardTint,
    Color textDark, {
    Key? key,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: cardTint,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Built for global trade. Designed for trust.",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: silver,
              letterSpacing: 0.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            t.loginTitle,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: t.email,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: t.password,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          if (_errorMessage != null)
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),

          const SizedBox(height: 16),

          // Login Button (Gold)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: gold,
                foregroundColor: backgroundWhite,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _loading ? null : _login,
              child: _loading
                  ? CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(backgroundWhite),
                    )
                  : Text(t.login),
            ),
          ),
          const SizedBox(height: 12),

          // Register Button (Silver)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: silver,
                foregroundColor: backgroundWhite,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(t.register),
            ),
          ),
        ],
      ),
    );
  }
}