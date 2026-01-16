import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// 1. PILLAR IMPORTS (High-tech Web3 pages)
import 'pillars/web3_trust_page.dart';
import 'pillars/ddp_logistics_page.dart'; 
import 'pillars/forex_bridge_page.dart'; 
import 'pillars/global_pay_page.dart';   
import 'pillars/trade_visualizer_page.dart'; 
import 'pillars/network_hub_page.dart'; // FIXED: Added Pillar 6

// 2. EXISTING PAGE IMPORTS
import 'package:mbrics/main_menu/main_menu_page.dart';
import 'package:mbrics/login/login_screen.dart';
import 'package:mbrics/registration/registration_screen.dart';

// 3. LOCALIZATION
import 'package:mbrics/l10n/app_localizations.dart'; 

// 4. MODULE IMPORTS
import 'package:mbrics/settings/settings_page.dart';
import 'package:mbrics/profile/profile_page.dart';
import 'package:mbrics/profile/edit_profile_page.dart';

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
  bool _initialized = false;
  Session? _session;

  @override
  void initState() {
    super.initState();
    _checkInitialSession();
  }

  // FIXED: Logic for "Stay Logged In" with a loading guard
  Future<void> _checkInitialSession() async {
    // Small delay ensures the Supabase local storage is fully read
    await Future.delayed(const Duration(milliseconds: 500));
    final session = Supabase.instance.client.auth.currentSession;
    setState(() {
      _session = session;
      _initialized = true;
    });
  }

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // PREVENT WHITE SCREEN: Loader shows while checking session
    if (!_initialized) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator(color: Color(0xFFC2994B))),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mBrics Terminal',
      locale: _locale,
      
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFC2994B), 
        fontFamily: 'Inter', 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), 
        Locale('zh')
      ],

      // If session exists, user stays logged in. If not, Login Screen.
      home: _session != null 
          ? MainMenuPage(onLocaleChange: _setLocale) 
          : LoginScreen(onLocaleChange: _setLocale), 

      routes: {
        '/login': (context) => LoginScreen(onLocaleChange: _setLocale),
        '/register': (context) => RegistrationScreen(onLocaleChange: _setLocale),
        '/main_menu': (context) => MainMenuPage(onLocaleChange: _setLocale),
        
        // 6 PILLARS - All routes now connected to correct pages
        '/trust_engine': (context) => const Web3TrustPage(), 
        '/ddp': (context) => const DdpLogisticsPage(),
        '/pay': (context) => const GlobalPayPage(), 
        '/forex': (context) => const ForexBridgePage(),
        '/trade_visual': (context) => const TradeVisualizerPage(),
        '/network': (context) => const NetworkHubPage(), // FIXED: Connected to Pillar 6
        
        // MODULES
        '/settings': (context) => SettingsPage(onLocaleChange: _setLocale),
        '/profile': (context) => const ProfilePage(),
        '/editprofile': (context) => const EditProfilePage(),
      },
    );
  }
}