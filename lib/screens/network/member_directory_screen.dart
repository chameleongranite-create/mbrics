import 'package:flutter/material.dart';


class MemberDirectoryScreen extends StatelessWidget {
  const MemberDirectoryScreen({super.key});

  final Color goldBase = const Color(0xFFC2994B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mBRICS NETWORK", style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCategoryHeader("STRATEGIC PARTNERS (GLOBAL 500)"),
          _memberTile("Logistics Partner", "Xiamen Region", true),
          _memberTile("Trade Infrastructure", "Global Node", true),
          const SizedBox(height: 25),
          _buildCategoryHeader("VERIFIED MEMBERS"),
          _memberTile("John Doe", "Institutional Importer", false),
          _memberTile("Bennie Burger", "Commodity Trader", false),
          _memberTile("Chameleon Granite", "Export Member", false),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Text(title, style: TextStyle(fontFamily: 'Inter',fontSize: 11, fontWeight: FontWeight.w800, color: Colors.grey)),
    );
  }

  Widget _memberTile(String name, String role, bool isPartner) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isPartner ? goldBase : Colors.grey[200],
          child: Icon(isPartner ? Icons.stars : Icons.person, color: isPartner ? Colors.white : Colors.grey),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.verified, color: Colors.blue, size: 18),
      ),
    );
  }
}