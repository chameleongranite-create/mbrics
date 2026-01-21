import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

class TradeVisualizerPage extends StatelessWidget {
  const TradeVisualizerPage({super.key});

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1),
        ),
        title: Text("SYSTEM STATUS", 
          style: MBricsTheme.monoStyle.copyWith(fontSize: 18, color: MBricsTheme.goldBase)),
        content: Text(
          t.visualDemoNotice,
          style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("CONFIRM", 
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
    canPop: false, // Intercepts the back button to prevent white screen
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      // Redirect to Main Menu for safe navigation
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
          // Consistent ARB Key for the Pillar Title
          title: Text(t.menuGlobalTracking.toUpperCase(), 
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
                        Text(t.visualPageTitle.toUpperCase(), 
                          style: MBricsTheme.headingStyle.copyWith(fontSize: 24, height: 1.1)),
                        Text(t.visualHeroTitle, 
                          style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 24, height: 1.1)),
                        const SizedBox(height: 10),
                        Text(t.visualEngineTag, 
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
                          'assets/icons/visualizer.png', 
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: Colors.black, 
                            child: const Icon(Icons.timeline, color: MBricsTheme.goldBase)
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
                    Text(t.visualHeroSlogan.toUpperCase(), 
                      style: MBricsTheme.monoStyle.copyWith(fontSize: 13)),
                    const SizedBox(height: 12),
                    Text(t.visualDescription, 
                      style: MBricsTheme.bodyStyle.copyWith(color: Colors.white, fontSize: 14, height: 1.6)),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // --- THE SMART CONTRACT TIMELINE ---
              
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep1Title, t.visualStep1Desc, true, true),
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep2Title, t.visualStep2Desc, true, true),
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep3Title, t.visualStep3Desc, true, true),
              _buildTimelineStep(Colors.white24, t.visualStep4Title, t.visualStep4Desc, false, true),
              _buildTimelineStep(Colors.white24, t.visualStep5Title, t.visualStep5Desc, false, false),

              const SizedBox(height: 40),

              HoverButton(
                buttonText: t.visualCtaButton,
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

  Widget _buildTimelineStep(Color color, String title, String subtitle, bool isDone, bool showLine) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isDone ? color : Colors.transparent,
                  border: Border.all(color: color, width: 2),
                  shape: BoxShape.circle,
                ),
                child: isDone ? const Icon(Icons.check, size: 14, color: MBricsTheme.terminalBlack) : null,
              ),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 2,
                    color: color.withOpacity(0.2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: MBricsTheme.headingStyle.copyWith(fontSize: 16, color: isDone ? Colors.white : Colors.white38)),
                const SizedBox(height: 4),
                Text(subtitle, style: MBricsTheme.bodyStyle.copyWith(fontSize: 13)),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}