import "../layout/master_layout.dart";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../l10n/app_localizations.dart';

class ForexPage extends StatefulWidget {
  const ForexPage({super.key, this.onLocaleChange});

  final void Function(Locale)? onLocaleChange;

  @override
  State<ForexPage> createState() => _ForexPageState();
}

class _ForexPageState extends State<ForexPage> {
  double? usdToCny;
  double? usdToZar;
  double? cnyToZar;
  bool loading = true;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    fetchRates();
  }

  Future<void> fetchRates() async {
    setState(() {
      loading = true;
      errorMsg = null;
    });

    try {
      final url = Uri.parse(
          'https://api.frankfurter.app/latest?from=USD&to=CNY,ZAR');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rates = Map<String, dynamic>.from(data['rates']);

        final cny = (rates['CNY'] as num?)?.toDouble();
        final zar = (rates['ZAR'] as num?)?.toDouble();

        setState(() {
          usdToCny = cny;
          usdToZar = zar;
          cnyToZar = (cny != null && zar != null) ? (zar / cny) : null;
          loading = false;
          errorMsg = (cny == null || zar == null)
              ? 'Missing CNY/ZAR in response'
              : null;
        });
      } else {
        setState(() {
          loading = false;
          errorMsg = 'HTTP ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        errorMsg = 'Network or parsing error: $e';
      });
    }
  }

  Widget buildRateCard(String label, double? value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value != null ? value.toStringAsFixed(4) : '—',
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  void _toggleLang() {
    final currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      widget.onLocaleChange?.call(const Locale('zh'));
    } else {
      widget.onLocaleChange?.call(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return MasterLayout(
      onLocaleChange: widget.onLocaleChange,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.forex),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: _toggleLang,
              tooltip: t.toggleLang,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: fetchRates,
              tooltip: t.forex_subtitle,
            ),
          ],
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  if (errorMsg != null)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        '${t.noData}: $errorMsg',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 12),
                  buildRateCard(t.usdToCny, usdToCny, Icons.currency_yuan),
                  buildRateCard(t.usdToZar, usdToZar, Icons.currency_exchange),
                  buildRateCard(t.cnyToZar, cnyToZar, Icons.swap_horiz),
                  const SizedBox(height: 12),
                ],
              ),
      ),
    );
  }
}