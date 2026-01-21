import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

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
        // Simple language for non-tech users
        title: Text("System Notice", 
          style: MBricsTheme.monoStyle.copyWith(fontSize: 18, color: MBricsTheme.goldBase)),
        content: Text(
          t.networkDemoNotice,
          style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", 
              style: MBricsTheme.bodyStyle.copyWith(color: MBricsTheme.goldBase, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  final t = AppLocalizations.of(context)!;

  return PopScope(
    canPop: false, // Prevents falling back to an empty web stack
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      // Safety: Always route back to the Engine Hub
      Navigator.pushReplacementNamed(context, '/mainmenu');
    },
    child: MasterLayout(
      child: Scaffold(
        backgroundColor: MBricsTheme.terminalBlack,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: MBricsTheme.goldBase, size: 20),
            onPressed: () => Navigator.pushReplacementNamed(context, '/mainmenu'),
          ),
          // Using the localized menu key for absolute consistency
          title: Text(t.menuGlobalNetwork.toUpperCase(), 
            style: MBricsTheme.headingStyle.copyWith(fontSize: 11, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- FULL WIDTH NETWORK LOGO ---
              Container(
                width: double.infinity,
                height: 140,
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    'assets/icons/network.png', 
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.hub_outlined, color: MBricsTheme.goldBase, size: 50),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- HERO SECTION ---
                    Text(t.networkHeroTitle1, 
                      style: MBricsTheme.headingStyle.copyWith(fontSize: 32, height: 1.1)),
                    Text(t.networkHeroTitle2, 
                      style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 32, height: 1.1)),
                    const SizedBox(height: 15),
                    Text(t.networkHeroSlogan, 
                      style: MBricsTheme.bodyStyle.copyWith(fontSize: 14, height: 1.5)),
                    
                    const SizedBox(height: 35),

                    // --- INSTITUTIONAL CATEGORIES ---
                    _sectionHeader(t.networkSectionRegulatory),
                    _partnerTile(t.networkPartnerCentralBank, "Global Protocol", t.networkStatusActive),
                    
                    const SizedBox(height: 25),
                    _sectionHeader(t.networkSectionInfrastructure),
                    _partnerTile(t.networkPartnerGlobal500, "Maritime & Air", t.networkStatusReady),
                    _partnerTile(t.networkPartnerInstitutional, "Regional Logistics", t.networkStatusVetting),
                    
                    const SizedBox(height: 25),
                    _sectionHeader(t.networkSectionFinance),
                    _partnerTile(t.networkPartnerBanks, "Forex & Liquidity", t.networkStatusBinding),
                    
                    const SizedBox(height: 40),
                    
                    // --- CTA BUTTON ---
                    HoverButton(
                      buttonText: t.networkCtaButton,
                      onPressed: () => _showDemoNotice(context, t),
                    ),

                    const SizedBox(height: 30),

                    // --- CONCEPT FOOTERS ---
                    Row(
                      children: [
                        Expanded(child: _conceptTag(t.networkTagTrust)),
                        const SizedBox(width: 15),
                        Expanded(child: _conceptTag(t.networkTagVerified)),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title.toUpperCase(), 
        style: MBricsTheme.headingStyle.copyWith(fontSize: 10, color: MBricsTheme.goldBase, letterSpacing: 1)),
    );
  }

  Widget _partnerTile(String category, String layer, String status) {
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
          const Icon(Icons.shield_outlined, color: MBricsTheme.goldBase, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, 
                  maxLines: 1, 
                  overflow: TextOverflow.ellipsis,
                  style: MBricsTheme.headingStyle.copyWith(fontSize: 15, color: Colors.white)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(layer, style: MBricsTheme.bodyStyle.copyWith(fontSize: 11)),
                    const Spacer(),
                    Text(status.toUpperCase(), 
                      style: MBricsTheme.monoStyle.copyWith(fontSize: 9)),
                  ],
                ),
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
          style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.silver, fontSize: 9)),
      ),
    );
  }
}