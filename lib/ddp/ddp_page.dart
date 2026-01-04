import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';

class DDPPage extends StatefulWidget {
  const DDPPage({super.key, required this.onLocaleChange});

  final void Function(Locale) onLocaleChange;

  @override
  State<DDPPage> createState() => _DDPPageState();
}

class _DDPPageState extends State<DDPPage> {
  String? originCountry;
  String? destinationCountry;
  String? incoterm;
  String? shipmentType;
  String? containerType;
  String? hsCode;
  double goodsValue = 0.0;
  double volume = 0.0;
  double weight = 0.0;

  Map<String, dynamic>? quoteResult;
  final formatter = NumberFormat.currency(symbol: 'R', decimalDigits: 2);

  void _toggleLang(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange(const Locale('zh'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  void _calculateQuote() {
    // Mock freight values
    double freight = shipmentType == 'FCL'
        ? 50490.0
        : volume * 200.0; // R200 per CBM for LCL

    // CIF = goods + freight
    double cif = goodsValue + freight;

    // Duty = 5% flat
    double duty = cif * 0.05;

    // VAT = 15% of (CIF + Duty)
    double vat = (cif + duty) * 0.15;

    // Clearance fee
    double clearance = 750.0;

    // Transport (mock zone-based)
    double transport = destinationCountry == 'South Africa' ? 5000.0 : 8000.0;

    double grandTotal = cif + duty + vat + clearance + transport;
    double netLanded = grandTotal - vat;

    setState(() {
      quoteResult = {
        'freight': freight,
        'cif': cif,
        'duty': duty,
        'vat': vat,
        'clearance': clearance,
        'transport': transport,
        'grandTotal': grandTotal,
        'netLanded': netLanded,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.ddp),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _toggleLang(context),
            tooltip: t.toggleLang,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: t.originCountry),
              items: ['China', 'South Africa']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => originCountry = val),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: t.destinationCountry),
              items: ['South Africa', 'China']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => destinationCountry = val),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: t.incoterm),
              items: ['FOB', 'EXW', 'CIF']
                  .map((i) => DropdownMenuItem(value: i, child: Text(i)))
                  .toList(),
              onChanged: (val) => setState(() => incoterm = val),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: t.shipmentType),
              items: ['FCL', 'LCL']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (val) => setState(() => shipmentType = val),
            ),
            if (shipmentType == 'FCL')
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: t.containerType),
                items: ['20ft', '40ft', '40ft HC']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) => setState(() => containerType = val),
              ),
            if (shipmentType == 'LCL')
              TextFormField(
                decoration: InputDecoration(labelText: t.volume),
                keyboardType: TextInputType.number,
                onChanged: (val) =>
                    setState(() => volume = double.tryParse(val) ?? 0.0),
              ),
            TextFormField(
              decoration: InputDecoration(labelText: t.goodsValue),
              keyboardType: TextInputType.number,
              onChanged: (val) =>
                  setState(() => goodsValue = double.tryParse(val) ?? 0.0),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: t.hsCode),
              onChanged: (val) => setState(() => hsCode = val),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: t.weight),
              keyboardType: TextInputType.number,
              onChanged: (val) =>
                  setState(() => weight = double.tryParse(val) ?? 0.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateQuote,
              child: Text(t.generateQuote),
            ),
            if (quoteResult != null) ...[
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Freight: ${formatter.format(quoteResult!['freight'])}'),
                      Text('Duty: ${formatter.format(quoteResult!['duty'])}'),
                      Text('VAT: ${formatter.format(quoteResult!['vat'])}'),
                      Text('Clearance: ${formatter.format(quoteResult!['clearance'])}'),
                      Text('Transport: ${formatter.format(quoteResult!['transport'])}'),
                      const Divider(),
                      Text(
                        'Grand Total: ${formatter.format(quoteResult!['grandTotal'])}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Net Landed Cost: ${formatter.format(quoteResult!['netLanded'])}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}