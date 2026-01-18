import 'package:flutter/material.dart';
import '../../layout/master_layout.dart';
import '../widgets/mbrics_components.dart';

class TradeAgreementScreen extends StatelessWidget {
  const TradeAgreementScreen({super.key});

  static const Color gold = Color(0xFFC2994B);
  static const Color charcoal = Color(0xFF121212);
  static const Color terminalGreen = Color(0xFF4CAF50);
  static const Color silver = Color(0xFFA7A9AC);

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                _buildContractStatus(),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildSmartContractTerms()),
                    const SizedBox(width: 24),
                    Expanded(flex: 2, child: _buildSettlementChain()),
                  ],
                ),
                const SizedBox(height: 40),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "WEB3 SETTLEMENT TERMINAL",
          style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 22, letterSpacing: 1.5),
        ),
        const SizedBox(height: 4),
        const Text(
          "CONTRACT ID: MB-CN-SA-2026-8892",
          style: TextStyle(fontFamily: 'monospace', color: gold, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildContractStatus() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: charcoal,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statusItem("ESCROW STATUS", "ACTIVE / LOCKED", terminalGreen),
          _statusItem("FUNDS VERIFIED", "1,250,000 e-CNY", Colors.white),
          _statusItem("NETWORK", "mBRIDGE V1.0.4", silver),
        ],
      ),
    );
  }

  Widget _statusItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'monospace', color: silver, fontSize: 10)),
        const SizedBox(height: 5),
        Text(value, style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, color: valueColor, fontSize: 14)),
      ],
    );
  }

  Widget _buildSmartContractTerms() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SMART CONTRACT PARAMETERS", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
          const SizedBox(height: 20),
          _termLine("1. CONDITION", "BILL OF LADING VERIFIED BY XIANGYU"),
          _termLine("2. CURRENCY", "e-CNY (DIGITAL YUAN)"),
          _termLine("3. FX PROTECTION", "LOCKED @ 0.3852 ZAR/CNY"),
          _termLine("4. ARBITRATION", "BANK OF CHINA DIGITAL COURT"),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            "“Execution will occur automatically upon the digital trigger from the port of Shanghai oracle.”",
            style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.italic, color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _termLine(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontFamily: 'monospace', color: gold, fontSize: 10, fontWeight: FontWeight.bold)),
          Text(desc, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSettlementChain() {
    return Column(
      children: [
        _chainStep("SA NODE", "Funds Authorized", true),
        _chainStep("SARB BRIDGE", "Compliance Check", true),
        _chainStep("PBOC HUB", "Digital Minting", true),
        _chainStep("ESCROW VAULT", "Locked in Web3", false),
      ],
    );
  }

  Widget _chainStep(String node, String task, bool isDone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(isDone ? Icons.verified : Icons.hourglass_empty, color: isDone ? terminalGreen : gold, size: 20),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(node, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
              Text(task, style: const TextStyle(color: silver, fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: charcoal,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text("EXECUTE SMART CONTRACT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
          ),
        ),
      ],
    );
  }
}