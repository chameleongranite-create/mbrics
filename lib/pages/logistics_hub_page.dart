import 'package:flutter/material.dart';
import 'package:mbrics/l10n/app_localizations.dart'; // Ensure this matches your generated path
import '../layout/master_layout.dart';
import '../widgets/mbrics_components.dart';

class LogisticsHubPage extends StatelessWidget {
  const LogisticsHubPage({super.key});

  // Institutional Palette
  final Color gold = const Color(0xFFC2994B);
  final Color charcoal = const Color(0xFF121212);
  final Color terminalGreen = const Color(0xFF4CAF50);
  final Color silver = const Color(0xFFA7A9AC);

  @override
  Widget build(BuildContext context) {
    // Localization helper
    final l10n = AppLocalizations.of(context)!;

    return MasterLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(l10n),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildLandedCostCalculator(l10n)),
                    const SizedBox(width: 24),
                    Expanded(flex: 2, child: _buildRouteIntelligence(l10n)),
                  ],
                ),
                const SizedBox(height: 30),
                _buildActiveShipmentTracker(l10n),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.logisticsCommand, 
              style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: 1)),
            Text(l10n.ddpAnalysisSub, 
              style: TextStyle(fontFamily: 'monospace', color: gold, fontSize: 12)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(border: Border.all(color: gold), borderRadius: BorderRadius.circular(4)),
          child: Text(l10n.partnerXiangyu, 
            style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 10, color: charcoal)),
        )
      ],
    );
  }

  Widget _buildLandedCostCalculator(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.landedCostTitle, 
            style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(height: 20),
          _costRow("FOB VALUE (UNIT)", "¥ 45,000.00", isBold: true),
          _costRow("OCEAN FREIGHT", "¥ 3,200.00"),
          _costRow("IMPORT DUTIES (15%)", "¥ 6,750.00"),
          _costRow("PORT HANDLING", "¥ 1,150.00"),
          _costRow("LAST-MILE LOGISTICS", "¥ 850.00"),
          const Divider(height: 40),
          _costRow("TOTAL LANDED COST", "¥ 56,950.00", isHighlight: true),
          _costRow("EST. ZAR EQUIVALENT", "R 148,070.00", isZar: true),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: charcoal, padding: const EdgeInsets.all(20)),
              child: Text(l10n.lockFxRate, 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Inter')),
            ),
          )
        ],
      ),
    );
  }

  Widget _costRow(String label, String value, {bool isBold = false, bool isHighlight = false, bool isZar = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, 
            style: TextStyle(fontFamily: 'Inter', fontSize: 11, color: isHighlight ? charcoal : Colors.grey.shade600, fontWeight: isHighlight ? FontWeight.w900 : FontWeight.normal)),
          Text(value, 
            style: TextStyle(fontFamily: 'monospace', fontSize: isHighlight ? 16 : 13, fontWeight: (isBold || isHighlight) ? FontWeight.bold : FontWeight.normal, color: isZar ? gold : charcoal)),
        ],
      ),
    );
  }

  Widget _buildRouteIntelligence(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: charcoal, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.routeIntelligence, 
            style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(height: 20),
          _routeStep("ORIGIN", "DURBAN, ZA", true),
          _routeStep("TRANSIT", "SINGAPORE", false),
          _routeStep("DESTINATION", "SHANGHAI, CN", false),
          const SizedBox(height: 20),
          const Text("EST. TRANSIT: 22 DAYS", 
            style: TextStyle(fontFamily: 'monospace', color: Colors.greenAccent, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _routeStep(String stage, String location, bool isComplete) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(isComplete ? Icons.check_circle : Icons.radio_button_unchecked, color: isComplete ? terminalGreen : gold, size: 16),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stage, style: TextStyle(fontFamily: 'monospace', color: silver, fontSize: 10)),
              Text(location, style: const TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActiveShipmentTracker(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.activeShipments, 
            style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 14)),
          const SizedBox(height: 20),
          Table(
            columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2), 2: FlexColumnWidth(2), 3: FlexColumnWidth(1)},
            children: [
              TableRow(children: [_th("ID"), _th("COMMODITY"), _th("STATUS"), _th("ETA")]),
              TableRow(children: [_td("#MB-992"), _td("Premium Wine"), _td("IN TRANSIT"), _td("24 JAN")]),
              TableRow(children: [_td("#MB-104"), _td("Chrome Ore"), _td("CUSTOMS"), _td("18 JAN")]),
            ],
          )
        ],
      ),
    );
  }

  Widget _th(String txt) => Padding(padding: const EdgeInsets.all(8), child: Text(txt, style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, color: gold, fontSize: 10)));
  Widget _td(String txt) => Padding(padding: const EdgeInsets.all(8), child: Text(txt, style: const TextStyle(fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.w500)));
}