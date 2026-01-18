import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../widgets/mbrics_components.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;

  // mBrics Institutional Palette
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color gold = Color(0xFFC2994B);
  static const Color charcoal = Color(0xFF121212);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color borderGray = Color(0xFFEEEEEE);

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
      setState(() { userData = data; });
    } catch (e) {
      debugPrint('Sync Error: $e');
    }
  }

  Future<void> _logout() async {
    await Supabase.instance.client.auth.signOut();
    if (mounted) Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _uploadAvatar() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final fileBytes = await pickedFile.readAsBytes();
    final fileName = 'avatar_$uid.png';

    try {
      await Supabase.instance.client.storage
          .from('avatars')
          .uploadBinary(fileName, fileBytes, fileOptions: const FileOptions(upsert: true));

      final publicUrl = Supabase.instance.client.storage.from('avatars').getPublicUrl(fileName);

      await Supabase.instance.client.from('users').update({'avatar_url': publicUrl}).eq('id', uid);

      setState(() { userData?['avatar_url'] = publicUrl; });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Identity Image Synchronized')));
      }
    } catch (e) {
      debugPrint('Upload Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    if (userData == null) {
      return const MasterLayout(onLocaleChange: null, child: Center(child: CircularProgressIndicator(color: gold)));
    }

    final avatarUrl = userData!['avatar_url'] as String?;
    final avatarImage = avatarUrl != null && avatarUrl.isNotEmpty
        ? NetworkImage(avatarUrl)
        : null;

    return MasterLayout(
      onLocaleChange: (locale) {},
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.maxWidth < 800
                        ? Column(children: [_buildIdentityCard(avatarImage), const SizedBox(height: 30), _buildActionPanel(t)])
                        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Expanded(flex: 2, child: _buildIdentityCard(avatarImage)),
                            const SizedBox(width: 40),
                            Expanded(flex: 3, child: _buildActionPanel(t)),
                          ]);
                  },
                ),
                const SizedBox(height: 60),
                _buildStatusFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/mbrics_logo.png', height: 80),
        const SizedBox(height: 16),
        Text("VERIFIED MEMBER IDENTITY",
            style: TextStyle(fontFamily: 'Inter',letterSpacing: 3, fontSize: 11, fontWeight: FontWeight.w900, color: gold)),
      ],
    );
  }

  Widget _buildIdentityCard(ImageProvider? avatarImage) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: charcoal,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: gold.withOpacity(0.15), blurRadius: 30, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: gold.withOpacity(0.1),
                backgroundImage: avatarImage,
                child: avatarImage == null ? const Icon(Icons.person, size: 60, color: gold) : null,
              ),
              Positioned(
                bottom: 0, right: 0,
                child: GestureDetector(
                  onTap: _uploadAvatar,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: gold, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(userData!['full_name']?.toUpperCase() ?? "UNKNOWN ENTITY",
              style: TextStyle(fontFamily: 'Inter',color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(userData!['company'] ?? "No Company Linked",
              style: TextStyle(fontFamily: 'Inter',color: gold, fontSize: 12, fontWeight: FontWeight.w600)),
          const Divider(color: Colors.white10, height: 40),
          _identityRow("NETWORK ID", Supabase.instance.client.auth.currentUser?.id.substring(0, 12).toUpperCase() ?? ""),
          _identityRow("NODE STATUS", "ACTIVE / VERIFIED"),
        ],
      ),
    );
  }

  Widget _identityRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'ShareTechMono',color: silver, fontSize: 10)),
          Text(value, style: TextStyle(fontFamily: 'ShareTechMono',color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildActionPanel(AppLocalizations t) {
    return Column(
      children: [
        _buildActionTile(Icons.hub_outlined, "ACCESS TRADE TERMINAL", "Enter the main mBrics dashboard to manage trades.", "GO TO TERMINAL", gold, () {
          Navigator.pushReplacementNamed(context, '/mainmenu');
        }),
        const SizedBox(height: 16),
        _buildActionTile(Icons.settings_suggest_outlined, "ACCOUNT CONFIGURATION", "Modify contact details and notification protocols.", "EDIT DETAILS", silver, () {
          Navigator.pushNamed(context, '/editprofile');
        }),
        const SizedBox(height: 40),
        TextButton.icon(
          onPressed: _logout,
          icon: const Icon(Icons.power_settings_new, color: Colors.redAccent, size: 18),
          label: Text("TERMINATE SESSION", style: TextStyle(fontFamily: 'Inter',color: Colors.redAccent, fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1)),
        ),
      ],
    );
  }

  Widget _buildActionTile(IconData icon, String title, String desc, String btn, Color color, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGray),
      ),
      child: Row(
        children: [
          Icon(icon, color: charcoal, size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 0.5)),
                Text(desc, style: TextStyle(fontFamily: 'Inter',color: silver, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            child: Text(btn, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shield, color: Colors.green, size: 14),
        const SizedBox(width: 8),
        Text("END-TO-END ENCRYPTED CONNECTION", style: TextStyle(fontFamily: 'ShareTechMono',fontSize: 10, color: silver)),
      ],
    );
  }
}