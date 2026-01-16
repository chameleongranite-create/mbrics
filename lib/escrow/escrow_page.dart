import '../layout/master_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EscrowPage extends StatefulWidget {
  const EscrowPage({super.key, this.onLocaleChange});
  final void Function(Locale)? onLocaleChange;

  @override
  State<EscrowPage> createState() => _EscrowPageState();
}

class _EscrowPageState extends State<EscrowPage> {
  final Color gold = const Color(0xFFC2994B);
  final Color charcoal = const Color(0xFF343A40);

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            
            // Contract Status Hero
            _buildContractStatusCard(),
            
            const SizedBox(height: 30),
            const Text("SETTLEMENT MILESTONES", 
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
            const SizedBox(height: 16),
            
            // Milestone Tracker
            _buildMilestone(
              "Contract Initiated", 
              "Digital signature verified by BoC Node", 
              true, 
              true
            ),
            _buildMilestone(
              "Funds Locked (Escrow)", 
              "145,000.00 e-CNY secured in mBrics Vault", 
              true, 
              true
            ),
            _buildMilestone(
              "Bill of Lading Issued", 
              "Awaiting Xiamen Port verification...", 
              false, 
              false
            ),
            _buildMilestone(
              "Final Disbursement", 
              "Release upon Durban Customs clearance", 
              false, 
              false
            ),
            
            const SizedBox(height: 40),
            
            // Safety Note
            _buildSafetyNote(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("WEB3 SMART CONTRACTS", 
          style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w900, fontSize: 20, color: charcoal)),
        const Text("Automated Escrow & Multi-Sig Settlement", 
          style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildContractStatusCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: charcoal,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: gold.withOpacity(0.5), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("ACTIVE CONTRACT", style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                child: const Text("LOCKED", style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text("145,000.00 e-CNY", style: TextStyle(fontFamily: 'Inter',color: gold, fontSize: 28, fontWeight: FontWeight.bold)),
          const Text("Transaction ID: MB-XMN-DUR-8829", style: TextStyle(color: Colors.white24, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildMilestone(String title, String sub, bool isDone, bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                isDone ? Icons.check_circle : Icons.radio_button_unchecked, 
                color: isDone ? gold : Colors.grey.shade300, 
                size: 24
              ),
              if (title != "Final Disbursement")
                Container(width: 2, height: 30, color: Colors.grey.shade200),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? charcoal : Colors.grey)),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: gold.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.shield_outlined, color: gold, size: 20),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Funds are legally bound by the Digital Trade Agreement and can only be released via verifiable IoT or Port data triggers.",
              style: TextStyle(fontSize: 11, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}