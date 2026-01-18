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

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'The Digital Gateway for Global Trade'**
  String get slogan;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access the mBrics Web3 Engine'**
  String get loginSubtitle;

  /// No description provided for @secureAuth.
  ///
  /// In en, this message translates to:
  /// **'Secure Member Login'**
  String get secureAuth;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Registered Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Secure Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Enter Engine'**
  String get login;

  /// No description provided for @authNodeStandby.
  ///
  /// In en, this message translates to:
  /// **'Network Status: Secure & Online'**
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
  /// **'Modernizing Global Commerce'**
  String get joinNetwork;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'Security: 8+ Characters Required'**
  String get passwordHelper;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Request access to the trade network'**
  String get noAccount;

  /// No description provided for @pillar1Title.
  ///
  /// In en, this message translates to:
  /// **'Global Delivery'**
  String get pillar1Title;

  /// No description provided for @pillar1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'ALL-IN-ONE LOGISTICS\nDoor-to-door delivery with all taxes and shipping paid. No surprises.'**
  String get pillar1Subtitle;

  /// No description provided for @pillar2Title.
  ///
  /// In en, this message translates to:
  /// **'Global Pay'**
  String get pillar2Title;

  /// No description provided for @pillar2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'INSTANT TRANSFERS\nImmediate international payments between mBrics members with zero delay.'**
  String get pillar2Subtitle;

  /// No description provided for @pillar3Title.
  ///
  /// In en, this message translates to:
  /// **'Global Trust'**
  String get pillar3Title;

  /// No description provided for @pillar3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL POLICEMAN\nReplacing slow bank LCs with instant, automated digital verification.'**
  String get pillar3Subtitle;

  /// No description provided for @pillar4Title.
  ///
  /// In en, this message translates to:
  /// **'Global Forex'**
  String get pillar4Title;

  /// No description provided for @pillar4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'PRICE LOCKER\nLock your exchange rates now to stop worrying about bank fluctuations.'**
  String get pillar4Subtitle;

  /// No description provided for @pillar5Title.
  ///
  /// In en, this message translates to:
  /// **'Global Tracking'**
  String get pillar5Title;

  /// No description provided for @pillar5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'LIVE JOURNEY\nWatch your trade journey happen on a live, verified timeline.'**
  String get pillar5Subtitle;

  /// No description provided for @pillar6Title.
  ///
  /// In en, this message translates to:
  /// **'Global Networks'**
  String get pillar6Title;

  /// No description provided for @pillar6Subtitle.
  ///
  /// In en, this message translates to:
  /// **'ELITE PARTNERS\nBacked by Global 500 logistics leaders to handle every delivery promise.'**
  String get pillar6Subtitle;

  /// Greeting on the main dashboard
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}'**
  String mainGreeting(String name);

  /// No description provided for @globalTrustActive.
  ///
  /// In en, this message translates to:
  /// **'Global Trust: Active'**
  String get globalTrustActive;

  /// No description provided for @blockchainStatus.
  ///
  /// In en, this message translates to:
  /// **'Engine Status'**
  String get blockchainStatus;

  /// No description provided for @web3EngineTitle.
  ///
  /// In en, this message translates to:
  /// **'Web3 Protocol'**
  String get web3EngineTitle;

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

  /// No description provided for @docVerification.
  ///
  /// In en, this message translates to:
  /// **'Smart Verification: On'**
  String get docVerification;

  /// No description provided for @digitalTrustEnabled.
  ///
  /// In en, this message translates to:
  /// **'Digital Trust: Active'**
  String get digitalTrustEnabled;

  /// No description provided for @terminateSession.
  ///
  /// In en, this message translates to:
  /// **'Safe Log Out'**
  String get terminateSession;

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
  /// **'Global Delivery is currently simulating live China-Africa trade routes.'**
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
  /// **'We take the stress out of paying international suppliers. Using our secure Web3 engine, your money is held safely until the digital policeman confirms the documents are correct. It’s faster, cheaper, and safer than a standard bank wire.'**
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
  /// **'The Settlement Engine is currently in its core development phase.'**
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
  /// **'TRUST PROTOCOL'**
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
  /// **'The mBrics Trust Engine is our core Web3 technology. It replaces slow bank processes with automated blockchain verification. It ensures your documents are real and your payments are secure—acting as a digital guardian for every trade.'**
  String get trustIntroBody;

  /// No description provided for @trustSection1Title.
  ///
  /// In en, this message translates to:
  /// **'BLOCKCHAIN & CBDC INTEGRATION'**
  String get trustSection1Title;

  /// No description provided for @trustSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'SMART CONTRACT TRUST'**
  String get trustSection1Feature1Title;

  /// No description provided for @trustSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Replacing the bank LC with a digital handshake. Funds are only moved when every condition is met and verified on the blockchain.'**
  String get trustSection1Feature1Desc;

  /// No description provided for @trustSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'CBDC READY'**
  String get trustSection1Feature2Title;

  /// No description provided for @trustSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Built to handle Central Bank Digital Currencies for instant, state-backed trade settlement with zero friction.'**
  String get trustSection1Feature2Desc;

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
  /// **'Our engine scans and verifies Bill of Ladings and Invoices instantly, ensuring zero fraud in the trade cycle.'**
  String get trustSection2Feature1Desc;

  /// No description provided for @trustSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL ESCROW'**
  String get trustSection2Feature2Title;

  /// No description provided for @trustSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'A secure vault where funds are held and released only when the digital policeman confirms delivery and compliance.'**
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
  /// **'Global Trust is currently in its simulation phase. We are integrating with global nodes to bring you the full \'Digital Policeman\' experience soon.'**
  String get trustPopupBody;

  /// No description provided for @trustPopupAction.
  ///
  /// In en, this message translates to:
  /// **'UNDERSTOOD'**
  String get trustPopupAction;

  /// No description provided for @forexPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL FOREX'**
  String get forexPageTitle;

  /// No description provided for @forexCardLabel.
  ///
  /// In en, this message translates to:
  /// **'Institutional Live Rate'**
  String get forexCardLabel;

  /// No description provided for @forexCardStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: Rate Lockable via Web3 Engine'**
  String get forexCardStatus;

  /// No description provided for @forexSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'THE MBRICS ADVANTAGE'**
  String get forexSectionTitle;

  /// No description provided for @forexDescription.
  ///
  /// In en, this message translates to:
  /// **'We eliminate the guesswork in global trade. By showing all prices in your local currency in real-time, we provide total transparency. When you start a trade, our Web3 engine is designed to \'lock\' this rate into a Smart Contract.'**
  String get forexDescription;

  /// No description provided for @forexFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'LOCAL CURRENCY ACCURACY'**
  String get forexFeature1Title;

  /// No description provided for @forexFeature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Avoid manual math. Every price on the platform is automatically converted to your native currency using live feeds.'**
  String get forexFeature1Desc;

  /// No description provided for @forexFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'CONTRACT-LOCKED RATES'**
  String get forexFeature2Title;

  /// No description provided for @forexFeature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Planned: Once the trade begins, the engine guarantees the exchange rate for the duration of the shipment.'**
  String get forexFeature2Desc;

  /// No description provided for @forexCtaButton.
  ///
  /// In en, this message translates to:
  /// **'LOCK RATE & PROCEED'**
  String get forexCtaButton;

  /// No description provided for @forexStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: DATA FEED ACTIVE'**
  String get forexStatusTag;

  /// No description provided for @forexEngineTag.
  ///
  /// In en, this message translates to:
  /// **'ENGINE: FX STABILIZATION ROADMAP'**
  String get forexEngineTag;

  /// No description provided for @forexDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'The Web3 Rate Locking protocol is currently in the testing phase.'**
  String get forexDemoNotice;

  /// No description provided for @visualPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRACKING'**
  String get visualPageTitle;

  /// No description provided for @visualHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Visualizer'**
  String get visualHeroTitle;

  /// No description provided for @visualHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Follow every step of your trade journey'**
  String get visualHeroSlogan;

  /// No description provided for @visualDescription.
  ///
  /// In en, this message translates to:
  /// **'No more guessing where your money or goods are. Our web3 engine tracks every single document and payment on a live timeline.'**
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
  /// **'Global Tracking is currently integrating real-time GPS and blockchain logs.'**
  String get visualDemoNotice;

  /// No description provided for @networkPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL NETWORKS'**
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
  /// **'Our Web3 engine connects you to a verified grid of central bank overseen nodes and institutional trade leaders.'**
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
  /// **'Global Networks is currently in the institutional onboarding phase.'**
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
  /// **'Join the mBrics Hub'**
  String get joinHub;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Network'**
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
  /// **'Already a member? Sign in'**
  String get alreadyHaveAccount;

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
  /// **'Email is required'**
  String get errorEmailRequired;

  /// No description provided for @errorInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get errorInvalidEmailFormat;

  /// No description provided for @errorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get errorPasswordRequired;

  /// No description provided for @errorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get errorPasswordTooShort;

  /// No description provided for @errorCompanyNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Company name is required'**
  String get errorCompanyNameRequired;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get errorUnexpected;

  /// No description provided for @errorRegistrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to register at this time'**
  String get errorRegistrationFailed;
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
