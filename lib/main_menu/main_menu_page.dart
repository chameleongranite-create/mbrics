import '../layout/master_layout.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

class MenuItem {
  final String title;
  final String route;
  final IconData icon;
  const MenuItem(this.title, this.route, this.icon);
}

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  Map<String, dynamic>? userData;

  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color borderGray = Color(0xFFE0E0E0);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color flashySilver = Color(0xFFD8D8D8);
  static const Color gold = Color(0xFFC2994B);
  static const Color textDark = Color(0xFF343A40);
  static const Color textSoft = Color(0xFF666666);
  static const Color platinumFill = Color(0xFFE5E4E2);

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;
    try {
      final data = await Supabase.instance.client
          .from('users')
          .select('full_name')
          .eq('id', uid)
          .single();
      setState(() => userData = data);
    } catch (e) {
      debugPrint('Error fetching profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isWide = MediaQuery.of(context).size.width >= 1000;
    final userName =
        Supabase.instance.client.auth.currentUser?.userMetadata?['full_name'] ??
            'User';

    final primaryFunctions = [
      MenuItem(t.pay, '/pay', Icons.payment),
      MenuItem(t.forex, '/forex', Icons.currency_exchange),
      MenuItem(t.escrow, '/escrow', Icons.lock),
    ];

    final secondaryFunctions = [
      MenuItem(t.editProfile, '/editprofile', Icons.edit),
      MenuItem(t.menuSettings, '/settings', Icons.settings),
    ];

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isWide)
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _SidePanel(
                    title: "Trust & Innovation",
                    items: [
                      {
                        "heading": "CBDC Settlement",
                        "text":
                            "Backed by China's Central Bank Digital Currency - secure, auditable, borderless."
                      },
                      {
                        "heading": "Transparent Costs",
                        "text":
                            "Every quote shows duties, VAT, and net landed cost clearly."
                      },
                      {
                        "heading": "Global Reach",
                        "text":
                            "Designed for cross-border trade with modern Web3 infrastructure."
                      },
                    ],
                    icon: Icons.verified,
                    imagePath: 'assets/icons/trust_01.png',
                  ),
                ),
              ),
            Flexible(
  flex: 2,
  child: Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _HeroBlock(userData),
            const SizedBox(height: 24),
            _FunctionBlock(
              title: t.mainMenuCoreFunctionsTitle,
              items: primaryFunctions,
              cardColor: platinumFill,
              iconColor: silver,
            ),
            const SizedBox(height: 24),
            _FunctionBlock(
              title: t.mainMenuUtilitiesTitle,
              items: secondaryFunctions,
              cardColor: backgroundWhite,
              iconColor: gold,
            ),
            const SizedBox(height: 16),
            _FooterBlock(t),
          ],
        ),
      ),
    ),
  ),
),
            if (isWide)
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _SidePanel(
                    title: "Core Features",
                    items: [
                      {
                        "heading": "DDP Quotes",
                        "text":
                            "Instant logistics quotes covering tariffs, freight, clearance, and inland transport."
                      },
                      {
                        "heading": "Send Money",
                        "text":
                            "Fast transfers powered by Central Bank Digital Currency - instant, secure, reliable."
                      },
                      {
                        "heading": "Blockchain Contracts",
                        "text":
                            "Smart contracts replacing Letters of Credit - milestone-based, auditable, trusted."
                      },
                    ],
                    icon: Icons.star,
                    imagePath: 'assets/icons/core_functions.png',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Hero greeting block
class _HeroBlock extends StatelessWidget {
  final Map<String, dynamic>? userData;
  const _HeroBlock(this.userData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFC2994B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset('assets/mbrics_logo.png', height: 80),
          const SizedBox(height: 16),
          Text(
            "Hi ${userData?['full_name'] ?? 'User'}, ready to get started?",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Your gateway to trusted trade, payments, and contracts.",
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            child: const Text(
              "View Profile",
              style: TextStyle(color: Color(0xFFA7A9AC)),
            ),
          ),
        ],
      ),
    );
  }
}

// Function block
class _FunctionBlock extends StatelessWidget {
  final String title;
  final List<MenuItem> items;
  final Color cardColor;
  final Color iconColor;

  const _FunctionBlock({
    Key? key,
    required this.title,
    required this.items,
    required this.cardColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF343A40),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...items.map(
          (item) => Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(item.icon, color: iconColor, size: 28),
              title: Text(
                item.title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF343A40),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF343A40),
              ),
              onTap: () => Navigator.pushNamed(context, item.route),
            ),
          ),
        ),
      ],
    );
  }
}

// Footer block
class _FooterBlock extends StatelessWidget {
  final AppLocalizations t;

  const _FooterBlock(this.t, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color footerSilver = Color(0xFFD8D8D8);
    const Color footerGold = Color(0xFFC2994B);
    const Color footerTextSoft = Color(0xFF666666);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: footerSilver.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: footerGold,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
              child: Text(t.logout),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Escrow releases only on milestones \nPayments protected with audit trails",
            style: GoogleFonts.inter(
              fontSize: 13,
              color: footerTextSoft,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "@ 2026 mBrics",
            style: GoogleFonts.inter(
              fontSize: 12,
              color: footerTextSoft,
            ),
          ),
        ],
      ),
    );
  }
}

// Side panel widget for wide layouts
class _SidePanel extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final IconData icon;
  final String imagePath;

  const _SidePanel({
    Key? key,
    required this.title,
    required this.items,
    required this.icon,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color panelSilver = Color(0xFFD8D8D8);
    const Color panelGold = Color(0xFFC2994B);
    const Color panelTextDark = Color(0xFF343A40);

    return Card(
      color: panelSilver.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: panelGold,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: panelTextDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: panelGold),
                        const SizedBox(width: 8),
                        Text(
                          entry['heading'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: panelTextDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry['text'] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: panelTextDark,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}