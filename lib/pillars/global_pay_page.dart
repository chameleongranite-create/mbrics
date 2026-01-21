import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';
// Note: Ensure MasterLayout and HoverButton are updated to use local fonts too
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

class GlobalPayPage extends StatelessWidget {
  const GlobalPayPage({super.key});

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), 
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1)
        ),
        // Simplified language for non-tech users as requested
        title: Text("System Notice", style: MBricsTheme.monoStyle),
        content: Text(
          t.payDemoNotice, 
          style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.5)
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: MBricsTheme.bodyStyle.copyWith(color: MBricsTheme.goldBase, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  final t = AppLocalizations.of(context)!;

  return PopScope(
    canPop: false, // Ensures the user doesn't pop into a white screen
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      // Force navigation back to the Main Menu
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
          // Consistent localized title
          title: Text(t.menuGlobalPay.toUpperCase(), 
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
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.payHeroTitle1, 
                          style: MBricsTheme.headingStyle.copyWith(fontSize: 24, height: 1.1)),
                        Text(t.payHeroTitle2, 
                          style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 24, height: 1.1)),
                        const SizedBox(height: 10),
                        Text("NETWORK: ACTIVE // PEER-TO-PEER: ENABLED", 
                          style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.silver, fontSize: 9)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: MBricsTheme.goldBase.withOpacity(0.3), width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          'assets/icons/pay.png', 
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.black,
                            child: const Icon(Icons.bolt, color: MBricsTheme.goldBase),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),

              // --- REVOLUTIONARY INTRO BLOCK ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: MBricsTheme.goldBase.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MBricsTheme.goldBase.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.payIntroTitle, style: MBricsTheme.monoStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 12),
                    Text(t.payIntroBody, 
                      style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.6)),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              _sectionHeader(t.paySection1Title),
              _buildFeatureTile(Icons.flash_on_outlined, t.paySection1Feature1Title, t.paySection1Feature1Desc),
              _buildFeatureTile(Icons.hub_outlined, t.paySection1Feature2Title, t.paySection1Feature2Desc),
              
              const SizedBox(height: 15),
              
              _sectionHeader(t.paySection2Title),
              _buildFeatureTile(Icons.account_balance_outlined, t.paySection2Feature1Title, t.paySection2Feature1Desc),
              _buildFeatureTile(Icons.timer_outlined, t.paySection2Feature2Title, t.paySection2Feature2Desc),

              const SizedBox(height: 40),

              HoverButton(
                buttonText: t.payCtaButton,
                onPressed: () => _showDemoNotice(context, t),
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
                Text(title, style: MBricsTheme.headingStyle.copyWith(fontSize: 15, color: Colors.white)),
                const SizedBox(height: 4),
                Text(desc, style: MBricsTheme.bodyStyle.copyWith(fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}