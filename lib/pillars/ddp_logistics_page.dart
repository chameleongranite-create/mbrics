import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // Updated path to match standard l10n
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

class DdpLogisticsPage extends StatelessWidget {
  const DdpLogisticsPage({super.key});

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), 
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1)
        ),
        title: Text("SYSTEM NOTICE", style: MBricsTheme.monoStyle.copyWith(fontSize: 16, color: MBricsTheme.goldBase)),
        content: Text(
          t.ddpDemoNotice, 
          style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 13, height: 1.5)
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
      canPop: false, // Prevents falling back to a white screen
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // Safety: Always return to Main Menu
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
            // Using localized Pillar title from ARB
            title: Text(t.menuGlobalDelivery.toUpperCase(), 
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
                          Text(t.ddpHeroTitle1, 
                            style: MBricsTheme.headingStyle.copyWith(fontSize: 24, height: 1.1)),
                          Text(t.ddpHeroTitle2, 
                            style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 24, height: 1.1)),
                          const SizedBox(height: 10),
                          Text(t.ddpTechStatus, 
                            style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.silver, fontSize: 9)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: MBricsTheme.goldBase.withOpacity(0.3), width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            'assets/ddP.png', 
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.black,
                              child: const Icon(Icons.local_shipping_outlined, color: MBricsTheme.goldBase),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),

                // --- INTRO BLOCK ---
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
                      Text(t.ddpIntroTitle, style: MBricsTheme.monoStyle.copyWith(fontSize: 14, color: MBricsTheme.goldBase)),
                      const SizedBox(height: 12),
                      Text(t.ddpIntroBody, style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 13, height: 1.6)),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // --- FEATURE LIST ---
                _sectionHeader(t.ddpSection1Title),
                _buildFeatureTile(Icons.calculate_outlined, t.ddpSection1Feature1Title, t.ddpSection1Feature1Desc),
                _buildFeatureTile(Icons.public, t.ddpSection1Feature2Title, t.ddpSection1Feature2Desc),
                
                const SizedBox(height: 15),
                
                _sectionHeader(t.ddpSection2Title),
                _buildFeatureTile(Icons.psychology_outlined, t.ddpSection2Feature1Title, t.ddpSection2Feature1Desc),
                _buildFeatureTile(Icons.lock_outline, t.ddpSection2Feature2Title, t.ddpSection2Feature2Desc),

                const SizedBox(height: 40),

                HoverButton(
                  buttonText: t.ddpCtaButton.toUpperCase(),
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
        style: MBricsTheme.headingStyle.copyWith(fontSize: 10, color: MBricsTheme.goldBase, letterSpacing: 1.5)),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MBricsTheme.goldBase, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.toUpperCase(), style: MBricsTheme.headingStyle.copyWith(fontSize: 13, color: Colors.white)),
                const SizedBox(height: 4),
                Text(desc, style: MBricsTheme.bodyStyle.copyWith(fontSize: 12, height: 1.4, color: MBricsTheme.silver)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}