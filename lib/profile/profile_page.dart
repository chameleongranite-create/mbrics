import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;

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
          .select('full_name, email, phone, company, avatar_url')
          .eq('id', uid)
          .single();

      setState(() {
        userData = data;
      });
    } catch (e) {
      debugPrint('Error fetching profile: $e');
    }
  }

  Future<void> _logout() async {
    await Supabase.instance.client.auth.signOut();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    if (userData == null) {
      return const MasterLayout(
        onLocaleChange: null,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final avatarUrl = userData!['avatar_url'] as String?;
    final avatarImage = avatarUrl != null && avatarUrl.isNotEmpty
        ? NetworkImage(avatarUrl)
        : const AssetImage('assets/default_avatar.png') as ImageProvider;

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600 ? screenWidth - 32 : 420.0;

    const Color backgroundWhite = Color(0xFFFFFFFF);
    const Color cardTint = Color(0xFFFAFAFA);     // soft white
    const Color borderGray = Color(0xFFE0E0E0);   // light gray border
    const Color silver = Color(0xFFA7A9AC);       // brushed silver
    const Color gold = Color(0xFFC2994B);         // metallic gold
    const Color textDark = Color(0xFF343A40);     // charcoal navy
    const Color textSoft = Color(0xFF666666);     // soft gray

    return MasterLayout(
      onLocaleChange: (locale) {},
      child: Container(
        color: backgroundWhite,
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  Image.asset(
                    'assets/mbrics_logo.png',
                    height: 120, // bigger logo
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Built for global trade. Designed for trust.",
                    style: TextStyle(
                      fontSize: 13,
                      color: textSoft,
                    ),
                  ),
                  const SizedBox(height: 32),

                  Container(
                    width: cardWidth,
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
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: avatarImage,
                            backgroundColor: textDark,
                          ),
                          const SizedBox(height: 16),

                          Text(
                            "Hi ${userData!['full_name'] ?? 'there'}!",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textDark,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Welcome to mBrics. You can personalize your profile or continue to the site.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: textSoft,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Upload Avatar (Silver)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: silver,
                                foregroundColor: backgroundWhite,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.upload),
                              label: const Text("Upload Avatar"),
                              onPressed: () {
                                // TODO: Navigate to avatar upload flow
                              },
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Edit Details (Silver)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: silver,
                                foregroundColor: backgroundWhite,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.edit),
                              label: const Text("Edit Personal Details"),
                              onPressed: () {
                                Navigator.pushNamed(context, '/editprofile');
                              },
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Continue to Site (Gold)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: gold,
                                foregroundColor: backgroundWhite,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text("Continue to Site"),
                              onPressed: () {
                                Navigator.pushNamed(context, '/mainmenu');
                              },
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Logout (Charcoal Navy)
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: textDark,
                            ),
                            icon: const Icon(Icons.logout),
                            label: Text(t.logout),
                            onPressed: _logout,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "© 2026 mBrics",
                    style: TextStyle(
                      fontSize: 12,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}