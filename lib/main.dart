import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'l10n/app_localizations.dart';
import 'login/login_screen.dart';
import 'registration/registration_screen.dart';
import 'main_menu/main_menu_page.dart';
import 'ddp/ddp_page.dart';
import 'forex/forex_page.dart';
import 'escrow/escrow_page.dart';
import 'pay/pay_page.dart';
import 'settings/settings_page.dart';
import 'profile/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kkpcgfndloaemphpbhnt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtrcGNnZm5kbG9hZW1waHBiaG50Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjczMzc0NDMsImV4cCI6MjA4MjkxMzQ0M30.dkG-vZu2iDVwnJeFWeW9GeuPGbl8cMRaCHC9wEf69-M',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mBrics',
      locale: const Locale('en'),
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
        '/login': (context) => LoginScreen(onLocaleChange: (_) {}),
        '/register': (context) => RegistrationScreen(onLocaleChange: (_) {}),
        '/mainmenu': (context) => MainMenuPage(onLocaleChange: (_) {}),
        '/ddp': (context) => DDPPage(onLocaleChange: (_) {}),
        '/forex': (context) => ForexPage(onLocaleChange: (_) {}),
        '/escrow': (context) => EscrowPage(onLocaleChange: (_) {}),
        '/pay': (context) => PayPage(onLocaleChange: (_) {}),
        '/settings': (context) => SettingsPage(onLocaleChange: (_) {}),
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