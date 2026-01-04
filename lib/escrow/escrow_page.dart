import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class EscrowPage extends StatefulWidget {
  const EscrowPage({super.key, required this.onLocaleChange});

  /// Callback to change the app's locale dynamically
  final void Function(Locale) onLocaleChange;

  @override
  State<EscrowPage> createState() => _EscrowPageState();
}

class _EscrowPageState extends State<EscrowPage> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();

  void _toggleLang(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange(const Locale('zh'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  void _createEscrow() {
    final t = AppLocalizations.of(context)!;
    final recipient = _recipientController.text.trim();
    final amount = _amountController.text.trim();

    if (recipient.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.noData)),
      );
      return;
    }

    // Demo action for escrow creation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${t.confirmPayment}: $recipient, $amount')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.escrow),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _toggleLang(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.escrow,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              t.hintSubtitle, // placeholder description
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              t.recipientLabel,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _recipientController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'e.g. Supplier Name',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              t.amountLabel,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 1000',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _createEscrow,
                child: Text(t.confirmPayment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}