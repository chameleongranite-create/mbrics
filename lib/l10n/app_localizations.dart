import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @loginSlogan.
  ///
  /// In en, this message translates to:
  /// **'THE GLOBAL TRADE STANDARD'**
  String get loginSlogan;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access the mBrics Web3 Engine'**
  String get loginSubtitle;

  /// No description provided for @secureAuth.
  ///
  /// In en, this message translates to:
  /// **'SECURE ACCESS'**
  String get secureAuth;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButton;

  /// No description provided for @registerLink.
  ///
  /// In en, this message translates to:
  /// **'REGISTER HERE'**
  String get registerLink;

  /// No description provided for @continueAsVisitor.
  ///
  /// In en, this message translates to:
  /// **'Enter as Guest'**
  String get continueAsVisitor;

  /// No description provided for @authNodeStandby.
  ///
  /// In en, this message translates to:
  /// **'SECURE NODE: READY'**
  String get authNodeStandby;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get greetingEvening;

  /// No description provided for @joinNetwork.
  ///
  /// In en, this message translates to:
  /// **'Join our Global Network'**
  String get joinNetwork;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'Security: 8+ Characters Required'**
  String get passwordHelper;

  /// No description provided for @noAccountYet.
  ///
  /// In en, this message translates to:
  /// **'REGISTER'**
  String get noAccountYet;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @poweredBy.
  ///
  /// In en, this message translates to:
  /// **'POWERED BY mBrics WEB3 ENGINE'**
  String get poweredBy;

  /// Greeting on the main dashboard
  ///
  /// In en, this message translates to:
  /// **'WELCOME, {name}'**
  String mainGreeting(String name);

  /// No description provided for @guestGreeting.
  ///
  /// In en, this message translates to:
  /// **'WELCOME, PARTNER'**
  String get guestGreeting;

  /// No description provided for @web3EngineTitle.
  ///
  /// In en, this message translates to:
  /// **'mBrics Web3 Engine'**
  String get web3EngineTitle;

  /// No description provided for @web3EngineDescription.
  ///
  /// In en, this message translates to:
  /// **'Replacing traditional bank LCs with instant, blockchain-secured trust.'**
  String get web3EngineDescription;

  /// No description provided for @engineStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Engine Status: Operational'**
  String get engineStatusActive;

  /// No description provided for @blockchainVerified.
  ///
  /// In en, this message translates to:
  /// **'Blockchain Verified'**
  String get blockchainVerified;

  /// No description provided for @trustProtocol.
  ///
  /// In en, this message translates to:
  /// **'Digital Trust Protocol: Active'**
  String get trustProtocol;

  /// No description provided for @tradeFinality.
  ///
  /// In en, this message translates to:
  /// **'Instant Trade Finality'**
  String get tradeFinality;

  /// No description provided for @finalityValid.
  ///
  /// In en, this message translates to:
  /// **'Trade Finality: Secured'**
  String get finalityValid;

  /// No description provided for @nodeLatency.
  ///
  /// In en, this message translates to:
  /// **'Verified Speed: 12ms'**
  String get nodeLatency;

  /// No description provided for @globalTrustActive.
  ///
  /// In en, this message translates to:
  /// **'Global Trust: Active'**
  String get globalTrustActive;

  /// No description provided for @docVerification.
  ///
  /// In en, this message translates to:
  /// **'Smart Document Verification: Active'**
  String get docVerification;

  /// No description provided for @digitalTrustEnabled.
  ///
  /// In en, this message translates to:
  /// **'Digital Trust: Active'**
  String get digitalTrustEnabled;

  /// No description provided for @secureNode.
  ///
  /// In en, this message translates to:
  /// **'Secure Node: Connected'**
  String get secureNode;

  /// No description provided for @engineUptime.
  ///
  /// In en, this message translates to:
  /// **'Verified Uptime: 99.9%'**
  String get engineUptime;

  /// No description provided for @documentVerification.
  ///
  /// In en, this message translates to:
  /// **'Smart Verification: Online'**
  String get documentVerification;

  /// No description provided for @engineLatency.
  ///
  /// In en, this message translates to:
  /// **'Network Latency: 12ms'**
  String get engineLatency;

  /// No description provided for @viewEngineStats.
  ///
  /// In en, this message translates to:
  /// **'View Engine Performance'**
  String get viewEngineStats;

  /// No description provided for @terminateSession.
  ///
  /// In en, this message translates to:
  /// **'Safe Log Out'**
  String get terminateSession;

  /// No description provided for @blockchainStatus.
  ///
  /// In en, this message translates to:
  /// **'Engine Status'**
  String get blockchainStatus;

  /// No description provided for @engineBenefit.
  ///
  /// In en, this message translates to:
  /// **'Real-time Verification • No Bank Delays • 100% Trust'**
  String get engineBenefit;

  /// No description provided for @menuCoreNavigation.
  ///
  /// In en, this message translates to:
  /// **'CORE NAVIGATION'**
  String get menuCoreNavigation;

  /// No description provided for @menuWeb3Modules.
  ///
  /// In en, this message translates to:
  /// **'WEB3 MODULES'**
  String get menuWeb3Modules;

  /// No description provided for @menuMainHome.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get menuMainHome;

  /// No description provided for @menuGlobalDelivery.
  ///
  /// In en, this message translates to:
  /// **'Global Delivery'**
  String get menuGlobalDelivery;

  /// No description provided for @menuGlobalPay.
  ///
  /// In en, this message translates to:
  /// **'Global Pay'**
  String get menuGlobalPay;

  /// No description provided for @menuGlobalTrust.
  ///
  /// In en, this message translates to:
  /// **'Global Trust'**
  String get menuGlobalTrust;

  /// No description provided for @menuGlobalNetwork.
  ///
  /// In en, this message translates to:
  /// **'Global Network'**
  String get menuGlobalNetwork;

  /// No description provided for @menuGlobalTracking.
  ///
  /// In en, this message translates to:
  /// **'Global Tracking'**
  String get menuGlobalTracking;

  /// No description provided for @menuGlobalForex.
  ///
  /// In en, this message translates to:
  /// **'Global Forex'**
  String get menuGlobalForex;

  /// No description provided for @menuExitTerminal.
  ///
  /// In en, this message translates to:
  /// **'Exit Terminal'**
  String get menuExitTerminal;

  /// No description provided for @pillar1Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL DELIVERY'**
  String get pillar1Title;

  /// No description provided for @pillar1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'DDP LOGISTICS COMMAND\nComplete door-to-door delivery with all taxes and duties pre-calculated. No hidden fees or surprises at the border.'**
  String get pillar1Subtitle;

  /// No description provided for @pillar2Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL PAY'**
  String get pillar2Title;

  /// No description provided for @pillar2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'SETTLEMENT ENGINE\nImmediate international payments between mBrics members with zero delay, bypassing slow traditional bank networks.'**
  String get pillar2Subtitle;

  /// No description provided for @pillar3Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRUST'**
  String get pillar3Title;

  /// No description provided for @pillar3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'TRUST ENGINE\nReplacing slow bank Letters of Credit (LCs) with instant, automated digital verification through secure Web3 protocols.'**
  String get pillar3Subtitle;

  /// No description provided for @pillar4Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL FOREX'**
  String get pillar4Title;

  /// No description provided for @pillar4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'FOREX BRIDGE\nLock your exchange rates immediately through the engine to stop worrying about currency fluctuations during your trade.'**
  String get pillar4Subtitle;

  /// No description provided for @pillar5Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRACKING'**
  String get pillar5Title;

  /// No description provided for @pillar5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'TRADE VISUALIZER\nWatch your entire trade journey on a live, verified timeline. Total transparency from order to final payment release.'**
  String get pillar5Subtitle;

  /// No description provided for @pillar6Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL NETWORK'**
  String get pillar6Title;

  /// No description provided for @pillar6Subtitle.
  ///
  /// In en, this message translates to:
  /// **'NETWORK HUB\nConnect with Global 500 logistics leaders and institutional nodes to ensure every trade is handled by verified partners.'**
  String get pillar6Subtitle;

  /// No description provided for @visitorPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome, Future Partner'**
  String get visitorPopupTitle;

  /// No description provided for @visitorWelcomeMsg.
  ///
  /// In en, this message translates to:
  /// **'Experience the mBrics engine. Share your name to start the demo—no commitment required. We hope you\'ll join our network permanently soon.'**
  String get visitorWelcomeMsg;

  /// No description provided for @visitorNameLabel.
  ///
  /// In en, this message translates to:
  /// **'What is your name?'**
  String get visitorNameLabel;

  /// No description provided for @startExploring.
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get startExploring;

  /// No description provided for @visitorWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome, Partner'**
  String get visitorWelcomeTitle;

  /// No description provided for @visitorDataSync.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Web3 Node...'**
  String get visitorDataSync;

  /// No description provided for @ddpPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL DELIVERY'**
  String get ddpPageTitle;

  /// No description provided for @ddpHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'LOGISTICS YOU'**
  String get ddpHeroTitle1;

  /// No description provided for @ddpHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'CAN COUNT ON'**
  String get ddpHeroTitle2;

  /// No description provided for @ddpTechStatus.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM: ACTIVE // NODE: VERIFIED // CARRIER: GLOBAL_500'**
  String get ddpTechStatus;

  /// No description provided for @ddpHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'No hidden fees. Just clear shipping from port to your door.'**
  String get ddpHeroSlogan;

  /// No description provided for @ddpIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'WHAT DOES THE COST ENGINE DO?'**
  String get ddpIntroTitle;

  /// No description provided for @ddpIntroBody.
  ///
  /// In en, this message translates to:
  /// **'Our engine stops the guesswork. It calculates every tax, fee, and shipping cost in seconds. By connecting directly with global shipping lines, we give you an exact price before you pay for your order.'**
  String get ddpIntroBody;

  /// No description provided for @ddpSection1Title.
  ///
  /// In en, this message translates to:
  /// **'COST ANALYSIS'**
  String get ddpSection1Title;

  /// No description provided for @ddpSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'TAX & DUTY CALCULATOR'**
  String get ddpSection1Feature1Title;

  /// No description provided for @ddpSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Instant calculations for local duties and taxes so there are no surprises.'**
  String get ddpSection1Feature1Desc;

  /// No description provided for @ddpSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL CARRIER LINK'**
  String get ddpSection1Feature2Title;

  /// No description provided for @ddpSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'We connect you to the world\'s biggest shipping companies for live tracking.'**
  String get ddpSection1Feature2Desc;

  /// No description provided for @ddpSection2Title.
  ///
  /// In en, this message translates to:
  /// **'SMART ROUTING'**
  String get ddpSection2Title;

  /// No description provided for @ddpSection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'FASTEST ROUTES'**
  String get ddpSection2Feature1Title;

  /// No description provided for @ddpSection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'We find the quickest and cheapest ways to move your goods across the globe.'**
  String get ddpSection2Feature1Desc;

  /// No description provided for @ddpSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'EASY CUSTOMS'**
  String get ddpSection2Feature2Title;

  /// No description provided for @ddpSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Our system handles the paperwork so your goods don\'t get stuck at the border.'**
  String get ddpSection2Feature2Desc;

  /// No description provided for @ddpCtaButton.
  ///
  /// In en, this message translates to:
  /// **'CHECK MY SHIPPING COST'**
  String get ddpCtaButton;

  /// No description provided for @ddpDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon: Global Delivery is currently simulating live China-Africa trade routes.'**
  String get ddpDemoNotice;

  /// No description provided for @payPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL PAY'**
  String get payPageTitle;

  /// No description provided for @payHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'PAYMENTS YOU'**
  String get payHeroTitle1;

  /// No description provided for @payHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'CAN TRUST'**
  String get payHeroTitle2;

  /// No description provided for @payIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'HOW DO PAYMENTS WORK?'**
  String get payIntroTitle;

  /// No description provided for @payIntroBody.
  ///
  /// In en, this message translates to:
  /// **'We take the stress out of paying international suppliers. Using our secure Web3 engine, your money is held safely until the \'Digital Policeman\' confirms the documents are correct. It’s faster and safer than a standard bank wire.'**
  String get payIntroBody;

  /// No description provided for @paySection1Title.
  ///
  /// In en, this message translates to:
  /// **'SAFE SETTLEMENTS'**
  String get paySection1Title;

  /// No description provided for @paySection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'SECURE HOLDING'**
  String get paySection1Feature1Title;

  /// No description provided for @paySection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Your funds are protected in a digital vault and only released when the job is done.'**
  String get paySection1Feature1Desc;

  /// No description provided for @paySection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'INSTANT PAY'**
  String get paySection1Feature2Title;

  /// No description provided for @paySection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'No more waiting days for banks. Once verified, payments happen in seconds.'**
  String get paySection1Feature2Desc;

  /// No description provided for @paySection2Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL REACH'**
  String get paySection2Title;

  /// No description provided for @paySection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'BORDERLESS TRADE'**
  String get paySection2Feature1Title;

  /// No description provided for @paySection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Pay suppliers in any country without the high fees of traditional banks.'**
  String get paySection2Feature1Desc;

  /// No description provided for @paySection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'DIRECT TO BANK'**
  String get paySection2Feature2Title;

  /// No description provided for @paySection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Suppliers receive funds directly into their local accounts with zero hassle.'**
  String get paySection2Feature2Desc;

  /// No description provided for @payCtaButton.
  ///
  /// In en, this message translates to:
  /// **'START A SECURE PAYMENT'**
  String get payCtaButton;

  /// No description provided for @payDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'Development Phase: The Settlement Engine is currently in its core development phase.'**
  String get payDemoNotice;

  /// No description provided for @trustPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRUST'**
  String get trustPageTitle;

  /// No description provided for @trustHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL'**
  String get trustHeroTitle1;

  /// No description provided for @trustHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'TRUST ENGINE'**
  String get trustHeroTitle2;

  /// No description provided for @trustHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'The heartbeat of mBrics. Automating security through code, not paperwork.'**
  String get trustHeroSlogan;

  /// No description provided for @trustIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'THE DIGITAL POLICEMAN'**
  String get trustIntroTitle;

  /// No description provided for @trustIntroBody.
  ///
  /// In en, this message translates to:
  /// **'The mBrics Trust Engine replaces slow bank Letter of Credits (LCs) with automated blockchain verification. It ensures your documents are real and your payments are secure—acting as a digital guardian for every trade.'**
  String get trustIntroBody;

  /// No description provided for @trustSection1Title.
  ///
  /// In en, this message translates to:
  /// **'BLOCKCHAIN INTEGRATION'**
  String get trustSection1Title;

  /// No description provided for @trustSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'SMART CONTRACT TRUST'**
  String get trustSection1Feature1Title;

  /// No description provided for @trustSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Replacing the bank LC with a digital handshake. Funds move only when every condition is verified on the blockchain.'**
  String get trustSection1Feature1Desc;

  /// No description provided for @trustSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'CBDC READY'**
  String get trustSection1Feature2Title;

  /// No description provided for @trustSection2Title.
  ///
  /// In en, this message translates to:
  /// **'VERIFICATION PROTOCOLS'**
  String get trustSection2Title;

  /// No description provided for @trustSection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'DOCUMENT AUTHENTICATION'**
  String get trustSection2Feature1Title;

  /// No description provided for @trustSection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Our engine verifies Bill of Ladings instantly, ensuring zero fraud in the trade cycle.'**
  String get trustSection2Feature1Desc;

  /// No description provided for @trustSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL ESCROW'**
  String get trustSection2Feature2Title;

  /// No description provided for @trustSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'A secure vault where funds are held and released only when delivery is confirmed.'**
  String get trustSection2Feature2Desc;

  /// No description provided for @trustCtaButton.
  ///
  /// In en, this message translates to:
  /// **'VERIFY MY PROTOCOL'**
  String get trustCtaButton;

  /// No description provided for @trustStatusTag.
  ///
  /// In en, this message translates to:
  /// **'V.1.0 STABLE'**
  String get trustStatusTag;

  /// No description provided for @trustEngineTag.
  ///
  /// In en, this message translates to:
  /// **'WEB3 ENGINE ACTIVE'**
  String get trustEngineTag;

  /// No description provided for @trustPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPMENT MODE'**
  String get trustPopupTitle;

  /// No description provided for @trustPopupBody.
  ///
  /// In en, this message translates to:
  /// **'Global Trust is currently in its simulation phase. We are integrating with global nodes to bring you the full experience soon.'**
  String get trustPopupBody;

  /// No description provided for @trustPopupAction.
  ///
  /// In en, this message translates to:
  /// **'UNDERSTOOD'**
  String get trustPopupAction;

  /// No description provided for @trustSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Built for Central Bank Digital Currencies (CBDC) to ensure instant, sovereign-backed trade settlement.'**
  String get trustSection1Feature2Desc;

  /// No description provided for @forexSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'THE mBRICS ADVANTAGE'**
  String get forexSectionTitle;

  /// No description provided for @forexPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL FOREX'**
  String get forexPageTitle;

  /// No description provided for @forexCardLabel.
  ///
  /// In en, this message translates to:
  /// **'mBrics DIRECT TRADE RATE (CNY/ZAR)'**
  String get forexCardLabel;

  /// No description provided for @forexCardStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: Rate Lockable via Web3 Engine'**
  String get forexCardStatus;

  /// No description provided for @forexDescription.
  ///
  /// In en, this message translates to:
  /// **'We eliminate currency risk for South African partners. By showing the direct value of 1 CNY in ZAR, we provide total transparency. When you start a trade, our Web3 engine is designed to \'lock\' this rate so you don\'t pay more later.'**
  String get forexDescription;

  /// No description provided for @forexFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'REAL-TIME ACCURACY'**
  String get forexFeature1Title;

  /// No description provided for @forexFeature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Every cost is automatically shown in ZAR using live feeds, so you know exactly what you are paying in South Africa.'**
  String get forexFeature1Desc;

  /// No description provided for @forexFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'CONTRACT-LOCKED RATES'**
  String get forexFeature2Title;

  /// No description provided for @forexFeature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Once the trade begins, the engine secures the exchange rate for the entire journey. No bank surprises.'**
  String get forexFeature2Desc;

  /// No description provided for @forexCtaButton.
  ///
  /// In en, this message translates to:
  /// **'SECURE RATE & PROCEED'**
  String get forexCtaButton;

  /// No description provided for @forexStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: LIVE DATA FEED'**
  String get forexStatusTag;

  /// No description provided for @forexEngineTag.
  ///
  /// In en, this message translates to:
  /// **'mBrics: FX STABILIZATION ACTIVE'**
  String get forexEngineTag;

  /// No description provided for @forexDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'Protocol Update: The Web3 Rate Locking engine for the CNY-ZAR route is currently in the testing phase.'**
  String get forexDemoNotice;

  /// No description provided for @visualPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRACKING'**
  String get visualPageTitle;

  /// No description provided for @visualHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'TRADE VISUALIZER'**
  String get visualHeroTitle;

  /// No description provided for @visualHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Follow every step of your trade journey'**
  String get visualHeroSlogan;

  /// No description provided for @visualDescription.
  ///
  /// In en, this message translates to:
  /// **'No more guessing where your money or goods are. Our Web3 engine tracks every document and payment on a live timeline.'**
  String get visualDescription;

  /// No description provided for @visualStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Trade Agreement'**
  String get visualStep1Title;

  /// No description provided for @visualStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Both parties signed and verified on blockchain.'**
  String get visualStep1Desc;

  /// No description provided for @visualStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Payment Secured'**
  String get visualStep2Title;

  /// No description provided for @visualStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Funds are held safely in the digital vault.'**
  String get visualStep2Desc;

  /// No description provided for @visualStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Logistics Active'**
  String get visualStep3Title;

  /// No description provided for @visualStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'Goods have left the port and are being tracked.'**
  String get visualStep3Desc;

  /// No description provided for @visualStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Customs Clearing'**
  String get visualStep4Title;

  /// No description provided for @visualStep4Desc.
  ///
  /// In en, this message translates to:
  /// **'Waiting for final digital document verification.'**
  String get visualStep4Desc;

  /// No description provided for @visualStep5Title.
  ///
  /// In en, this message translates to:
  /// **'Final Delivery'**
  String get visualStep5Title;

  /// No description provided for @visualStep5Desc.
  ///
  /// In en, this message translates to:
  /// **'Trade complete and funds released to supplier.'**
  String get visualStep5Desc;

  /// No description provided for @visualCtaButton.
  ///
  /// In en, this message translates to:
  /// **'VIEW LIVE SHIPMENT'**
  String get visualCtaButton;

  /// No description provided for @visualCtaButtonRefresh.
  ///
  /// In en, this message translates to:
  /// **'REFRESH LIVE STATUS'**
  String get visualCtaButtonRefresh;

  /// No description provided for @visualStatusTag.
  ///
  /// In en, this message translates to:
  /// **'Real-time Tracking'**
  String get visualStatusTag;

  /// No description provided for @visualStatusTagSync.
  ///
  /// In en, this message translates to:
  /// **'STATUS: MAP ENGINE SYNCING'**
  String get visualStatusTagSync;

  /// No description provided for @visualEngineTag.
  ///
  /// In en, this message translates to:
  /// **'Blockchain Timeline Active'**
  String get visualEngineTag;

  /// No description provided for @visualEngineTagRoadmap.
  ///
  /// In en, this message translates to:
  /// **'VISUALIZER: ROADMAP v1.0'**
  String get visualEngineTagRoadmap;

  /// No description provided for @visualDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'Simulation: Global Tracking is currently integrating real-time GPS and blockchain logs.'**
  String get visualDemoNotice;

  /// No description provided for @networkPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL NETWORK'**
  String get networkPageTitle;

  /// No description provided for @networkHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED'**
  String get networkHeroTitle1;

  /// No description provided for @networkHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'TRADE PARTNERS'**
  String get networkHeroTitle2;

  /// No description provided for @networkHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Our Web3 engine connects you to a verified grid of overseers and institutional trade leaders.'**
  String get networkHeroSlogan;

  /// No description provided for @networkSectionRegulatory.
  ///
  /// In en, this message translates to:
  /// **'Regulatory Compliance'**
  String get networkSectionRegulatory;

  /// No description provided for @networkSectionInfrastructure.
  ///
  /// In en, this message translates to:
  /// **'Infrastructure & Shipping'**
  String get networkSectionInfrastructure;

  /// No description provided for @networkSectionFinance.
  ///
  /// In en, this message translates to:
  /// **'Financial Settlement'**
  String get networkSectionFinance;

  /// No description provided for @networkPartnerCentralBank.
  ///
  /// In en, this message translates to:
  /// **'Central Bank Oversight Nodes'**
  String get networkPartnerCentralBank;

  /// No description provided for @networkPartnerGlobal500.
  ///
  /// In en, this message translates to:
  /// **'Global 500 Logistics Carriers'**
  String get networkPartnerGlobal500;

  /// No description provided for @networkPartnerInstitutional.
  ///
  /// In en, this message translates to:
  /// **'Institutional Trade Partners'**
  String get networkPartnerInstitutional;

  /// No description provided for @networkPartnerBanks.
  ///
  /// In en, this message translates to:
  /// **'Tier-1 Settlement Banks'**
  String get networkPartnerBanks;

  /// No description provided for @networkStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active Phase'**
  String get networkStatusActive;

  /// No description provided for @networkStatusReady.
  ///
  /// In en, this message translates to:
  /// **'Engine Protocol Ready'**
  String get networkStatusReady;

  /// No description provided for @networkStatusVetting.
  ///
  /// In en, this message translates to:
  /// **'Vetting in Progress'**
  String get networkStatusVetting;

  /// No description provided for @networkStatusBinding.
  ///
  /// In en, this message translates to:
  /// **'Smart Contract Binding'**
  String get networkStatusBinding;

  /// No description provided for @networkCtaButton.
  ///
  /// In en, this message translates to:
  /// **'REQUEST NETWORK ACCESS'**
  String get networkCtaButton;

  /// No description provided for @networkTagTrust.
  ///
  /// In en, this message translates to:
  /// **'DECENTRALISED TRUST'**
  String get networkTagTrust;

  /// No description provided for @networkTagVerified.
  ///
  /// In en, this message translates to:
  /// **'BLOCKCHAIN VERIFIED'**
  String get networkTagVerified;

  /// No description provided for @networkDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'In Development: Global Network is currently in the institutional onboarding phase.'**
  String get networkDemoNotice;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @toggleLang.
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get toggleLang;

  /// No description provided for @preferredCurrency.
  ///
  /// In en, this message translates to:
  /// **'Preferred Currency'**
  String get preferredCurrency;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @apiSource.
  ///
  /// In en, this message translates to:
  /// **'API Source'**
  String get apiSource;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @registrationSlogan.
  ///
  /// In en, this message translates to:
  /// **'Join the future of digital trade'**
  String get registrationSlogan;

  /// No description provided for @joinHub.
  ///
  /// In en, this message translates to:
  /// **'Join the mBrics Network'**
  String get joinHub;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get register;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your mBrics account'**
  String get registerSubtitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'ALREADY A MEMBER? SIGN IN HERE'**
  String get alreadyHaveAccount;

  /// No description provided for @registerSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to mBrics!'**
  String get registerSuccessTitle;

  /// No description provided for @registerSuccessMsg.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! You are now connected to the Web3 engine. We’ve built this technology to make global trade faster and more trustworthy. We are glad to have you with us.'**
  String get registerSuccessMsg;

  /// No description provided for @registerDemoNote.
  ///
  /// In en, this message translates to:
  /// **'(Note: For this demo, your account is pre-activated.)'**
  String get registerDemoNote;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get startNow;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @viewProfileBtn.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfileBtn;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @countryChina.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get countryChina;

  /// No description provided for @countrySouthAfrica.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get countrySouthAfrica;

  /// No description provided for @countryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get countryOther;

  /// No description provided for @countryCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get countryCodeHint;

  /// No description provided for @phoneOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone (Optional)'**
  String get phoneOptional;

  /// No description provided for @errorEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get errorEmailRequired;

  /// No description provided for @errorInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get errorInvalidEmailFormat;

  /// No description provided for @errorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get errorPasswordRequired;

  /// No description provided for @errorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get errorPasswordTooShort;

  /// No description provided for @errorCompanyNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your company name'**
  String get errorCompanyNameRequired;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'System error. Please try again.'**
  String get errorUnexpected;

  /// No description provided for @errorRegistrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration error'**
  String get errorRegistrationFailed;

  /// No description provided for @errorUserExists.
  ///
  /// In en, this message translates to:
  /// **'Email already registered. Please sign in.'**
  String get errorUserExists;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Check your details.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please wait.'**
  String get errorTooManyRequests;

  /// No description provided for @errorEmailNotConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email account.'**
  String get errorEmailNotConfirmed;

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Please use a stronger password.'**
  String get errorWeakPassword;

  /// No description provided for @errorNetworkIssue.
  ///
  /// In en, this message translates to:
  /// **'Connection error.'**
  String get errorNetworkIssue;

  /// No description provided for @errorLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in error. Try again.'**
  String get errorLoginFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
