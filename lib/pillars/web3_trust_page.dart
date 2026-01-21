import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

class Web3TrustPage extends StatelessWidget {
  const Web3TrustPage({super.key});

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1),
        ),
        // Simple language for everyday users
        title: Text("System Notice", 
          style: MBricsTheme.monoStyle.copyWith(fontSize: 18, color: MBricsTheme.goldBase)),
        content: Text(
          t.trustPopupBody,
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
    canPop: false, // Prevents the white screen issue on back-button
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      // Safety: Redirect specifically to Main Menu
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
          // Using the localized menu key for total consistency
          title: Text(t.menuGlobalTrust.toUpperCase(), 
            style: MBricsTheme.monoStyle.copyWith(fontSize: 10, letterSpacing: 2)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HERO SECTION ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.trustHeroTitle1, 
                          style: MBricsTheme.headingStyle.copyWith(fontSize: 32, height: 1.1)),
                        Text(t.trustHeroTitle2, 
                          style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 32, height: 1.1)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: MBricsTheme.goldBase.withOpacity(0.5), width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          'assets/icons/trust_engine_top.png',
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            height: 80,
                            color: Colors.black,
                            child: const Icon(Icons.gavel_rounded, color: MBricsTheme.goldBase),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // --- THE DIGITAL POLICEMAN INTRO BLOCK ---
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: MBricsTheme.goldBase.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MBricsTheme.goldBase.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.trustIntroTitle, 
                      style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 14, letterSpacing: 1)),
                    const SizedBox(height: 10),
                    Text(t.trustIntroBody, 
                      style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.5)),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // --- CORE TECHNOLOGY SECTIONS ---
              _sectionHeader(t.trustSection1Title),
              _buildFeatureTile(Icons.hub_outlined, t.trustSection1Feature1Title, t.trustSection1Feature1Desc),
              _buildFeatureTile(Icons.currency_bitcoin_outlined, t.trustSection1Feature2Title, t.trustSection1Feature2Desc),
              
              const SizedBox(height: 15),
              
              _sectionHeader(t.trustSection2Title),
              _buildFeatureTile(Icons.verified_user_outlined, t.trustSection2Feature1Title, t.trustSection2Feature1Desc),
              _buildFeatureTile(Icons.account_balance_wallet_outlined, t.trustSection2Feature2Title, t.trustSection2Feature2Desc),
              
              const SizedBox(height: 40),
              
              HoverButton(
                buttonText: t.trustCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),
              
              const SizedBox(height: 30),
              
              Row(
                children: [
                  Expanded(child: _conceptTag(t.trustStatusTag)),
                  const SizedBox(width: 15),
                  Expanded(child: _conceptTag(t.trustEngineTag)),
                ],
              ),
              const SizedBox(height: 40),
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

  Widget _buildFeatureTile(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MBricsTheme.goldBase, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, 
                  style: MBricsTheme.headingStyle.copyWith(fontSize: 15, color: Colors.white)),
                const SizedBox(height: 4),
                Text(desc, 
                  style: MBricsTheme.bodyStyle.copyWith(fontSize: 13, height: 1.4)),
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