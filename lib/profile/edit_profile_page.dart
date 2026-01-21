import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  bool _isSaving = false;

  // mBrics Institutional Palette
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color gold = Color(0xFFC2994B);
  static const Color charcoal = Color(0xFF121212);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color borderLight = Color(0xFFEEEEEE);

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final uid = Supabase.instance.client.auth.currentUser?.id;
    if (uid == null) return;
    try {
      final data = await Supabase.instance.client
          .from('users')
          .select('full_name, phone, company')
          .eq('id', uid)
          .single();

      setState(() {
        _nameController.text = data['full_name'] ?? '';
        _phoneController.text = data['phone'] ?? '';
        _companyController.text = data['company'] ?? '';
      });
    } catch (e) {
      debugPrint('Sync Error: $e');
    }
  }

  Future<void> _saveDetails() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final uid = Supabase.instance.client.auth.currentUser?.id;
    try {
      await Supabase.instance.client.from('users').update({
        'full_name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'company': _companyController.text.trim(),
      }).eq('id', uid!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('NETWORK IDENTITY SYNCHRONIZED')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Update Failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      onLocaleChange: (locale) {},
      child: Scaffold(
        backgroundColor: backgroundWhite,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 50),
                    
                    _buildTerminalField(
                      label: "OPERATIONAL NAME",
                      hint: "Enter Full Legal Name",
                      controller: _nameController,
                      icon: Icons.badge_outlined,
                      validator: (v) => (v == null || v.isEmpty) ? "Field Required" : null,
                    ),
                    const SizedBox(height: 30),
                    
                    _buildTerminalField(
                      label: "INSTITUTIONAL ENTITY",
                      hint: "Registered Company Name",
                      controller: _companyController,
                      icon: Icons.account_balance_outlined,
                    ),
                    const SizedBox(height: 30),
                    
                    _buildTerminalField(
                      label: "SECURE TELEPHONE",
                      hint: "+27 / +86 Country Code Included",
                      controller: _phoneController,
                      icon: Icons.settings_phone_outlined,
                    ),
                    
                    const SizedBox(height: 60),
                    _buildActionRow(),
                    const SizedBox(height: 40),
                    _buildSecurityNote(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 24, color: gold),
            const SizedBox(width: 12),
            Text("IDENTITY CONFIGURATION", 
              style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 1.5)),
          ],
        ),
        const SizedBox(height: 8),
        Text("Modify institutional parameters for your mBrics network node.", 
          style: TextStyle(fontFamily: 'Inter',color: silver, fontSize: 13)),
      ],
    );
  }

  Widget _buildTerminalField({
    required String label, 
    required String hint, 
    required TextEditingController controller, 
    required IconData icon,
    String? Function(String?)? validator
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontFamily: 'ShareTechMono',color: gold, fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(fontFamily: 'Inter',fontSize: 15, fontWeight: FontWeight.w600, color: charcoal),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: silver.withOpacity(0.5), fontSize: 13),
            prefixIcon: Icon(icon, color: charcoal, size: 20),
            filled: true,
            fillColor: const Color(0xFFF9F9F9),
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: borderLight), borderRadius: BorderRadius.circular(4)),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: charcoal, width: 1.5), borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("ABORT", style: TextStyle(fontFamily: 'Inter',color: silver, fontWeight: FontWeight.w900, letterSpacing: 1)),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: _isSaving ? null : _saveDetails,
            style: ElevatedButton.styleFrom(
              backgroundColor: charcoal,
              padding: const EdgeInsets.symmetric(vertical: 20),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: _isSaving 
              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : Text("SYNCHRONIZE DATA", style: TextStyle(fontFamily: 'Inter',color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 2)),
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityNote() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.lock_person_outlined, color: Colors.green, size: 18),
          const SizedBox(height: 8),
          Text("ENCRYPTED NODE UPDATE", style: TextStyle(fontFamily: 'ShareTechMono',color: Colors.green, fontSize: 10)),
          const SizedBox(height: 4),
          Text("Changes are broadcasted across the mBrics secure bridge instantly.", 
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Inter',color: silver, fontSize: 10)),
        ],
      ),
    );
  }
}