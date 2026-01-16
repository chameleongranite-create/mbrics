import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';

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
        title: Text(t.trustPopupTitle, 
          style: const TextStyle(fontFamily: 'ShareTechMono', color: MBricsTheme.goldBase, fontSize: 18)),
        content: Text(
          t.visualDemoNotice,
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
          title: Text(t.visualPageTitle.toUpperCase(), 
            style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP SECTION: Simple Explanation
              Text(t.visualHeroTitle, 
                style: const TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.bold, color: MBricsTheme.goldBase, letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Text(
                t.visualHeroSlogan,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 16, height: 1.5, color: Colors.white, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15),
              Text(
                t.visualDescription,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14, height: 1.6, color: MBricsTheme.silver),
              ),
              const SizedBox(height: 40),

              // VISUAL TIMELINE (The Web3 Engine Roadmap)
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep1Title, t.visualStep1Desc, true, true),
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep2Title, t.visualStep2Desc, true, true),
              _buildTimelineStep(MBricsTheme.goldBase, t.visualStep3Title, t.visualStep3Desc, true, true),
              _buildTimelineStep(Colors.white24, t.visualStep4Title, t.visualStep4Desc, false, true),
              _buildTimelineStep(Colors.white24, t.visualStep5Title, t.visualStep5Desc, false, false),

              const SizedBox(height: 40),

              // ACTION BUTTON
              _HoverButton(
                buttonText: t.visualCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),
              
              const SizedBox(height: 30),
              
              Row(
                children: [
                  Expanded(child: _conceptTag(t.visualStatusTag)),
                  const SizedBox(width: 15),
                  Expanded(child: _conceptTag(t.visualEngineTag)),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineStep(Color color, String title, String subtitle, bool isDone, bool showLine) {
    return Row(
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
              Container(
                width: 2,
                height: 50,
                color: color,
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 16, color: isDone ? Colors.white : Colors.white38)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontFamily: 'Inter', fontSize: 13, color: MBricsTheme.silver)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
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
          height: 60,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : MBricsTheme.goldBase,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(widget.buttonText, 
              style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.terminalBlack, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}