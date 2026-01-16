import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';

class GlobalPayPage extends StatelessWidget {
  const GlobalPayPage({super.key});

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
          t.payDemoNotice,
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
          title: Text(t.payPageTitle.toUpperCase(), 
            style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADING SECTION
              Text(t.payHeroTitle, 
                style: const TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.bold, color: MBricsTheme.goldBase, letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Text(
                t.payHeroSlogan,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 16, height: 1.5, color: Colors.white, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15),
              Text(
                t.payDescription,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14, height: 1.6, color: MBricsTheme.silver),
              ),
              
              const SizedBox(height: 30),
              
              // ESCROW STATUS CARD (Visualizing the "In Development" Vault)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.payEscrowStatusLabel, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, color: Colors.white)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.amber.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
                          child: Text(t.payStatusTag, style: const TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const Divider(height: 30, color: Colors.white10),
                    _payTile(Icons.shield_outlined, t.payFeature1Title, t.payFeature1Desc),
                    _payTile(Icons.account_balance_wallet_outlined, t.payFeature2Title, t.payFeature2Desc),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

              // THE LINK TO TRADE VISUALIZER
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: MBricsTheme.goldBase, width: 1.5),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/trade_visual'), 
                icon: const Icon(Icons.hub_outlined, color: MBricsTheme.goldBase),
                label: Text(t.payViewMapBtn, 
                  style: const TextStyle(fontFamily: 'Inter', color: MBricsTheme.goldBase, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              ),
              
              const SizedBox(height: 20),
              
              // ACTION BUTTON (Initialize Settlement)
              _HoverButton(
                buttonText: t.payCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _payTile(IconData icon, String title, String desc) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: MBricsTheme.goldBase),
      title: Text(title, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
      subtitle: Text(desc, style: const TextStyle(fontFamily: 'Inter', fontSize: 13, color: MBricsTheme.silver)),
    );
  }
}

// Re-using the _HoverButton for consistent branding
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