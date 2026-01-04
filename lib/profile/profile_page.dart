import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
          .select('full_name, email, phone, company')
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
    if (userData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full Name: ${userData!['full_name'] ?? ''}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Email: ${userData!['email'] ?? ''}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Phone: ${userData!['phone'] ?? ''}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Company: ${userData!['company'] ?? ''}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}