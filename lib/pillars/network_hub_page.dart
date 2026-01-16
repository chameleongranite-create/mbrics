import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';

class NetworkHubPage extends StatelessWidget {
  const NetworkHubPage({super.key});

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1),
        ),
        title: Text(t.trustPopupTitle, 
          style: const TextStyle(fontFamily: 'ShareTechMono', color: MBricsTheme.goldBase, fontSize: 18)),
        content: Text(
          t.networkDemoNotice,
          style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 14, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.trustPopupAction, 
              style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return MasterLayout(
      child: Scaffold(
        backgroundColor: MBricsTheme.terminalBlack,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: MBricsTheme.goldBase, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(t.networkPageTitle.toUpperCase(), 
            style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HERO SECTION ---
              Text(t.networkHeroTitle1, 
                style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
              Text(t.networkHeroTitle2, 
                style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
              const SizedBox(height: 15),
              Text(t.networkHeroSlogan, 
                style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.silver, fontSize: 14, height: 1.5)),
              
              const SizedBox(height: 35),

              // --- PARTNER LIST (Development Preview) ---
              _sectionHeader("Global Ocean Carriers"),
              _partnerTile("Maersk Line", "Global", "Vetting in progress"),
              _partnerTile("MSC Shipping", "Global", "Vetting in progress"),
              
              const SizedBox(height: 25),
              _sectionHeader("Regional Logistics Experts"),
              _partnerTile("JHB Logistics", "South Africa", "Planned Partner"),
              _partnerTile("Beijing Logistics Hub", "China", "Planned Partner"),
              
              const SizedBox(height: 40),
              
              // --- CTA BUTTON ---
              _HoverButton(
                buttonText: t.networkCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),

              const SizedBox(height: 30),

              // --- CONCEPT FOOTERS ---
              Row(
                children: [
                  Expanded(child: _conceptTag(t.networkStatusTag)),
                  const SizedBox(width: 15),
                  Expanded(child: _conceptTag(t.networkEngineTag)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title.toUpperCase(), 
        style: const TextStyle(fontFamily: 'Inter', fontSize: 10, fontWeight: FontWeight.w900, color: MBricsTheme.goldBase, letterSpacing: 1)),
    );
  }

  Widget _partnerTile(String name, String region, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_outlined, color: Colors.blueGrey, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                Text("$region • $status", style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.silver, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _conceptTag(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: Text(text.toUpperCase(), 
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'ShareTechMono', color: MBricsTheme.silver, fontSize: 9, letterSpacing: 0.5)),
      ),
    );
  }
}

// Re-using the _HoverButton logic from previous pages for consistency
class _HoverButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const _HoverButton({required this.onPressed, required this.buttonText});
  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : MBricsTheme.goldBase,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(widget.buttonText, 
              style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.terminalBlack, fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 1)),
          ),
        ),
      ),
    );
  }
}