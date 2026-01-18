import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// THEME & L10N
import 'theme/mbrics_theme.dart'; // Ensure this points to your theme file
import 'package:mbrics/l10n/app_localizations.dart'; 

// PILLAR IMPORTS
import 'pillars/web3_trust_page.dart';
import 'pillars/ddp_logistics_page.dart'; 
import 'pillars/forex_bridge_page.dart'; 
import 'pillars/global_pay_page.dart';   
import 'pillars/trade_visualizer_page.dart'; 
import 'pillars/network_hub_page.dart'; 

// PAGE IMPORTS
import 'package:mbrics/main_menu/main_menu_page.dart';
import 'package:mbrics/login/login_screen.dart';
import 'package:mbrics/registration/registration_screen.dart';
import 'package:mbrics/settings/settings_page.dart';
import 'package:mbrics/profile/profile_page.dart';
import 'package:mbrics/profile/edit_profile_page.dart';

class mBricsScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

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
  Locale _locale = const Locale('zh'); 

  @override
  void initState() {
    super.initState();
    // STABILITY: Listen for token errors to prevent the "Refresh Token Not Found" crash
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.signedOut) {
        // If the session is dead, handle cleanup logic if necessary
      }
    }, onError: (error) {
       if (error.toString().contains('refresh_token_not_found')) {
         // Force local logout to clear the corrupted token
         Supabase.instance.client.auth.signOut();
       }
    });
  }

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mBrics Terminal',
      locale: _locale, 
      scrollBehavior: mBricsScrollBehavior(),
      
      // CHINA COMPLIANCE: Use our custom local font theme
      theme: MBricsTheme.themeData, 

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), 
        Locale('zh')
      ],

      home: const SplashScreen(), 

      routes: {
        '/login': (context) => LoginScreen(onLocaleChange: _setLocale),
        '/register': (context) => RegistrationScreen(onLocaleChange: _setLocale),
        '/mainmenu': (context) => MainMenuPage(onLocaleChange: _setLocale),
        '/trust_engine': (context) => const Web3TrustPage(), 
        '/ddp': (context) => const DdpLogisticsPage(),
        '/pay': (context) => const GlobalPayPage(), 
        '/forex': (context) => const ForexBridgePage(),
        '/visualizer': (context) => const TradeVisualizerPage(),
        '/network': (context) => const NetworkHubPage(),
        '/settings': (context) => SettingsPage(onLocaleChange: _setLocale),
        '/profile': (context) => const ProfilePage(),
        '/editprofile': (context) => const EditProfilePage(),
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
    _checkInitialSession();
  }

  Future<void> _checkInitialSession() async {
    // Shorter delay for cleaner UX, but long enough for Supabase to init
    await Future.delayed(const Duration(milliseconds: 500));
    final session = Supabase.instance.client.auth.currentSession;
    
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, session != null ? '/mainmenu' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MBricsTheme.terminalBlack,
      body: const Center(
        child: CircularProgressIndicator(color: MBricsTheme.goldBase),
      ),
    );
  }
}