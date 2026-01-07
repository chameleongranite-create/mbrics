import 'package:flutter/material.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;
  final void Function(Locale)? onLocaleChange;

  const MasterLayout({
    super.key,
    required this.child,
    this.onLocaleChange,
  });

  void _toggleLang(BuildContext context, String langCode) {
    if (langCode == 'en') {
      onLocaleChange?.call(const Locale('en'));
    } else {
      onLocaleChange?.call(const Locale('zh'));
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundWhite = Color(0xFFFFFFFF);
    const Color topBarColor = Color(0xFF343A40); // Charcoal Navy
    const Color redAccent = Color(0xFFFF3B30);   // Red for Chinese label
    const Color whiteAccent = Color(0xFFFFFFFF); // White for English label

    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Column(
        children: [
          Container(
            height: 48,
            color: topBarColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _toggleLang(context, 'en'),
                  child: const Text(
                    "Digital Currency Bridge Platform",
                    style: TextStyle(
                      color: whiteAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _toggleLang(context, 'zh'),
                  child: const Text(
                    "数字货币桥平台",
                    style: TextStyle(
                      color: redAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}