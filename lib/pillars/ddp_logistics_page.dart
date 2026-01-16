import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';

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
        title: Text(t.trustPopupTitle, style: const TextStyle(fontFamily: 'ShareTechMono', color: MBricsTheme.goldBase)),
        content: Text(
          t.ddpDemoNotice, // Localized
          style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 14, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.trustPopupAction, style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontWeight: FontWeight.bold)),
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
          title: Text(t.ddpPageTitle, 
            style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HERO SECTION ---
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.ddpHeroTitle1, style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
                        Text(t.ddpHeroTitle2, style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
                        const SizedBox(height: 15),
                        Text(t.ddpHeroSlogan, style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.silver, fontSize: 16, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Image.asset("assets/ddp_explain.png", height: 160),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // --- TWO-COLUMN EXPLANATION GRID ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionHeader(t.ddpSection1Title),
                        _buildFeatureTile(Icons.calculate_outlined, t.ddpSection1Feature1Title, t.ddpSection1Feature1Desc),
                        _buildFeatureTile(Icons.public, t.ddpSection1Feature2Title, t.ddpSection1Feature2Desc),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionHeader(t.ddpSection2Title),
                        _buildFeatureTile(Icons.psychology_outlined, t.ddpSection2Feature1Title, t.ddpSection2Feature1Desc),
                        _buildFeatureTile(Icons.lock_outline, t.ddpSection2Feature2Title, t.ddpSection2Feature2Desc),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),

              // --- ACTION BUTTON ---
              _HoverButton(
                buttonText: t.ddpCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),
              
              const SizedBox(height: 30),

              // --- TECHNICAL FOOTER TAGS ---
              Row(
                children: [
                  Expanded(child: _conceptTag(t.ddpStatusTag)),
                  const SizedBox(width: 15),
                  Expanded(child: _conceptTag(t.ddpEngineTag)),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(title, 
        style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: MBricsTheme.goldBase, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(title, 
                  style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontWeight: FontWeight.w900, fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.silver, fontSize: 11, height: 1.5)),
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
        child: Text(
          text, 
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'ShareTechMono', color: MBricsTheme.silver, fontSize: 9, letterSpacing: 0.5),
        ),
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
          height: 55,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : MBricsTheme.goldBase,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _isHovered ? [BoxShadow(color: MBricsTheme.goldBase.withOpacity(0.4), blurRadius: 15)] : [],
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