import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../l10n/app_localizations.dart';
import '../layout/master_layout.dart';
import '../theme/mbrics_theme.dart';
import '../widgets/mbrics_components.dart';

class ForexBridgePage extends StatefulWidget {
  const ForexBridgePage({super.key});

  @override
  State<ForexBridgePage> createState() => _ForexBridgePageState();
}

class _ForexBridgePageState extends State<ForexBridgePage> {
  double? zarToCny;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchRates();
  }

  Future<void> fetchRates() async {
    if (!mounted) return;
    setState(() => loading = true);
    try {
      // Fetching live data for the Web3 Engine bridge
      // Frankfurter is a reliable open source for currency data
      final response = await http.get(Uri.parse('https://api.frankfurter.app/latest?from=ZAR&to=CNY'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          setState(() {
            zarToCny = (data['rates']['CNY'] as num).toDouble();
            loading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) setState(() => loading = false);
    }
  }

  void _showDemoNotice(BuildContext context, AppLocalizations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MBricsTheme.terminalBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: MBricsTheme.goldBase, width: 1),
        ),
        title: Text("ENGINE PROTOCOL", 
          style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 18)),
        content: Text(
          t.forexDemoNotice,
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
          title: Text(t.forexPageTitle.toUpperCase(), 
            style: MBricsTheme.headingStyle.copyWith(fontSize: 11, letterSpacing: 2)),
          actions: [
            IconButton(icon: const Icon(Icons.refresh, color: MBricsTheme.goldBase), onPressed: fetchRates)
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: loading 
                  ? Container(
                      height: 200, 
                      alignment: Alignment.center, 
                      child: const CircularProgressIndicator(color: MBricsTheme.goldBase)
                    )
                  : _buildLockCard(t),
              ),
              const SizedBox(height: 35),

              Text(t.forexSectionTitle, 
                style: MBricsTheme.headingStyle.copyWith(fontSize: 12, color: MBricsTheme.goldBase, letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Text(
                t.forexDescription,
                style: MBricsTheme.bodyStyle.copyWith(fontSize: 14, height: 1.6),
              ),
              
              const SizedBox(height: 35),
              
              

              _buildFeature(Icons.visibility_outlined, t.forexFeature1Title, t.forexFeature1Desc),
              _buildFeature(Icons.lock_clock_outlined, t.forexFeature2Title, t.forexFeature2Desc),

              const SizedBox(height: 40),
              
              HoverButton(
                buttonText: t.forexCtaButton,
                onPressed: () => _showDemoNotice(context, t),
              ),
              
              const SizedBox(height: 30),
              
              Row(
                children: [
                  Expanded(child: _conceptTag(t.forexStatusTag)),
                  const SizedBox(width: 15),
                  Expanded(child: _conceptTag(t.forexEngineTag)),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLockCard(AppLocalizations t) {
    return Container(
      key: const ValueKey("rateCard"),
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MBricsTheme.goldBase, width: 1),
        boxShadow: [BoxShadow(color: MBricsTheme.goldBase.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        children: [
          Text(t.forexCardLabel.toUpperCase(), style: MBricsTheme.monoStyle.copyWith(color: MBricsTheme.silver, letterSpacing: 2)),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1 ZAR ≈ ", style: MBricsTheme.headingStyle.copyWith(fontSize: 18)),
                Text(zarToCny?.toStringAsFixed(4) ?? "—", 
                  style: MBricsTheme.headingStyle.copyWith(color: MBricsTheme.goldBase, fontSize: 36)),
                Text(" CNY", style: MBricsTheme.headingStyle.copyWith(fontSize: 18)),
              ],
            ),
          ),
          const Divider(color: Colors.white10, height: 40),
          Text(t.forexCardStatus, style: MBricsTheme.bodyStyle.copyWith(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MBricsTheme.goldBase, size: 24),
          const SizedBox(width: 15),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: MBricsTheme.headingStyle.copyWith(fontSize: 15, color: Colors.white)),
              const SizedBox(height: 5),
              Text(desc, style: MBricsTheme.bodyStyle.copyWith(fontSize: 13, height: 1.4)),
            ],
          ))
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