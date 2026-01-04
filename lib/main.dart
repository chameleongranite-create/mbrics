import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'l10n/app_localizations.dart';
import 'package:mbrics/login/login_screen.dart';
import 'package:mbrics/registration/registration_screen.dart';
import 'package:mbrics/main_menu/main_menu_page.dart';
import 'package:mbrics/ddp/ddp_page.dart';
import 'package:mbrics/forex/forex_page.dart';
import 'package:mbrics/escrow/escrow_page.dart';
import 'package:mbrics/pay/pay_page.dart';
import 'package:mbrics/settings/settings_page.dart';
import 'package:mbrics/profile/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kkpcgfndloaemphpbhnt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtrcGNnZm5kbG9hZW1waHBiaG50Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjczMzc0NDMsImV4cCI6MjA4MjkxMzQ0M30.dkG-vZu2iDVwnJeFWeW9GeuPGbl8cMRaCHC9wEf69-M',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mBrics',
      locale: _locale,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white, // enforce white layout
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
      ],
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(onLocaleChange: _setLocale),
        '/register': (context) => RegistrationScreen(onLocaleChange: _setLocale),
        '/mainmenu': (context) => MainMenuPage(onLocaleChange: _setLocale),
        '/ddp': (context) => DDPPage(onLocaleChange: _setLocale),
        '/forex': (context) => ForexPage(onLocaleChange: _setLocale),
        '/escrow': (context) => EscrowPage(onLocaleChange: _setLocale),
        '/pay': (context) => PayPage(onLocaleChange: _setLocale),
        '/settings': (context) => SettingsPage(onLocaleChange: _setLocale),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndRoute();
  }

  Future<void> _checkSessionAndRoute() async {
    await Future.delayed(const Duration(milliseconds: 800)); // smoother pause
    final supabase = Supabase.instance.client;

    final session = supabase.auth.currentSession;
    final targetRoute = session != null ? '/mainmenu' : '/login';

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, targetRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // white background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Prominent logo during splash
            Image.asset('assets/mbrics_logo.png', height: 120),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}