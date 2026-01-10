import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;

  // Palette constants
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color cardTint = Color(0xFFFAFAFA);
  static const Color borderGray = Color(0xFFE0E0E0);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color gold = Color(0xFFC2994B);
  static const Color textDark = Color(0xFF343A40);
  static const Color textSoft = Color(0xFF666666);

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

  /// ✅ Upload Avatar function
  Future<void> _uploadAvatar() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final fileBytes = await pickedFile.readAsBytes();
    final fileName = '$uid.png';

    try {
      // Upload to Supabase Storage bucket "avatars"
      await Supabase.instance.client.storage
          .from('avatars')
          .uploadBinary(
            fileName,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );

      // Get public URL
      final publicUrl =
          Supabase.instance.client.storage.from('avatars').getPublicUrl(fileName);

      // Update user record in database
      await Supabase.instance.client
          .from('users')
          .update({'avatar_url': publicUrl}).eq('id', uid);

      // ✅ Update local state immediately so UI refreshes
      setState(() {
        userData?['avatar_url'] = publicUrl;
      });

      // Show success confirmation
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Avatar uploaded successfully!')),
        );
      }

      // Re-fetch from DB to stay in sync
      await _fetchProfile();
    } catch (e) {
      debugPrint('Error uploading avatar: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading avatar: $e')),
        );
      }
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

    return MasterLayout(
      onLocaleChange: (locale) {},
      child: Container(
        color: backgroundWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Image.asset('assets/mbrics_logo.png', height: 120),
                  const SizedBox(height: 8),
                  Text(
                    "Built for global trade. Designed for trust.",
                    style: const TextStyle(fontSize: 13, color: textSoft),
                  ),
                  const SizedBox(height: 32),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmall = constraints.maxWidth < 700;
                      if (isSmall) {
                        return _buildStackedLayout(avatarImage, t);
                      } else {
                        return _buildTwoColumnLayout(avatarImage, t);
                      }
                    },
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    "© 2026 mBrics",
                    style: TextStyle(fontSize: 12, color: textDark),
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

  Widget _buildStackedLayout(ImageProvider avatarImage, AppLocalizations t) {
    return Column(
      children: [
        _buildAvatarBlock(avatarImage),
        const SizedBox(height: 24),
        _buildActionTiles(t),
      ],
    );
  }

  Widget _buildTwoColumnLayout(ImageProvider avatarImage, AppLocalizations t) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildAvatarBlock(avatarImage)),
        const SizedBox(width: 32),
        Expanded(child: _buildActionTiles(t)),
      ],
    );
  }

  Widget _buildAvatarBlock(ImageProvider avatarImage) {
    return Container(
      decoration: BoxDecoration(
        color: gold,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: avatarImage,
            backgroundColor: textDark,
          ),
          const SizedBox(height: 16),
          const Text(
            "Your Profile",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            "Personalize your account or jump straight into trading.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTiles(AppLocalizations t) {
    return Column(
      children: [
        _buildActionTile(
          icon: Icons.photo_camera_outlined,
          title: "Upload Avatar",
          description: "Add a photo so partners recognize you instantly.",
          buttonText: "Upload",
          buttonColor: silver,
          textColor: backgroundWhite,
          onPressed: _uploadAvatar,
        ),
        const SizedBox(height: 16),
        _buildActionTile(
          icon: Icons.edit_note,
          title: "Edit Personal Details",
          description: "Update name, phone, company — kept secure and in sync.",
          buttonText: "Edit details",
          buttonColor: silver,
          textColor: backgroundWhite,
          onPressed: () {
            Navigator.pushNamed(context, '/editprofile');
          },
        ),
        const SizedBox(height: 16),
        _buildActionTile(
          icon: Icons.arrow_forward_rounded,
          title: "Continue to the Platform",
          description: "Access quotes, escrow, and payments — all in one place.",
          buttonText: "Continue",
          buttonColor: gold,
          textColor: backgroundWhite,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/mainmenu');
          },
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: textDark,
            side: const BorderSide(color: borderGray),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          icon: const Icon(Icons.logout),
          label: const Text("Sign out safely"),
          onPressed: _logout,
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
    required Color buttonColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGray),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderGray),
            ),
            child: Icon(icon, color: textDark),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: textSoft,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: textColor,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}