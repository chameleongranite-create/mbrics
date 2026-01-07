import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key, required this.onLocaleChange});

  final void Function(Locale) onLocaleChange;

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  String selectedCurrency = 'CNY'; // default
  double? amountCny;
  double? amountZar;
  String? paymentMethod;
  bool paymentSuccess = false;

  // Mock forex rates (later pull from ForexPage or backend)
  final double usdToCny = 7.15;
  final double usdToZar = 18.50;

  double get cnyToZar => usdToZar / usdToCny;

  void _toggleLang() {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange(const Locale('zh'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  void _updateAmounts(String value) {
    final input = double.tryParse(value);
    if (input == null) return;

    setState(() {
      if (selectedCurrency == 'CNY') {
        amountCny = input;
        amountZar = input * cnyToZar;
      } else {
        amountZar = input;
        amountCny = input / cnyToZar;
      }
    });
  }

  void _processPayment() {
    final t = AppLocalizations.of(context)!;

    if (amountCny == null || amountZar == null || paymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.noData)),
      );
      return;
    }

    // 🔑 Future integration:
    // sendToBOC(amountCny!);
    // recordWeb3Contract({amountCny, amountZar, paymentMethod});

    setState(() {
      paymentSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return MasterLayout(onLocaleChange: (locale) {}, child: Scaffold(
      appBar: AppBar(
        title: Text(t.payTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _toggleLang,
            tooltip: t.toggleLang,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCurrency,
              decoration: InputDecoration(labelText: t.currency),
              items: ['CNY', 'ZAR']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => selectedCurrency = val!),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '${t.amount} (${selectedCurrency})'),
              keyboardType: TextInputType.number,
              onChanged: _updateAmounts,
            ),
            const SizedBox(height: 12),
            if (amountCny != null && amountZar != null)
              Card(
                child: ListTile(
                  title: Text(t.convertedAmount),
                  subtitle: Text(
                      'CNY: ${amountCny!.toStringAsFixed(2)} | ZAR: ${amountZar!.toStringAsFixed(2)}'),
                ),
              ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: t.method),
              items: ['Bank Transfer', 'Card', 'Crypto']
                  .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                  .toList(),
              onChanged: (val) => setState(() => paymentMethod = val),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _processPayment,
              icon: const Icon(Icons.payment),
              label: Text(t.payBtn),
            ),
            if (paymentSuccess)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.green.shade100,
                  child: ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(t.paySuccess),
                    subtitle: Text(
                        'CNY: ${amountCny?.toStringAsFixed(2)} | ZAR: ${amountZar?.toStringAsFixed(2)}\nMethod: $paymentMethod'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}