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
  /// **'THE GLOBAL GATEWAY FOR DIGITAL TRADE'**
  String get slogan;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to mBrics'**
  String get loginSubtitle;

  /// No description provided for @secureAuth.
  ///
  /// In en, this message translates to:
  /// **'MEMBER SIGN IN'**
  String get secureAuth;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'EMAIL ADDRESS'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get login;

  /// No description provided for @authNodeStandby.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM ONLINE & SECURE'**
  String get authNodeStandby;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @joinNetwork.
  ///
  /// In en, this message translates to:
  /// **'DIGITALIZING GLOBAL TRADE'**
  String get joinNetwork;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 8 characters'**
  String get passwordHelper;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'New to the network? Create an account'**
  String get noAccount;

  /// No description provided for @blockchainStatus.
  ///
  /// In en, this message translates to:
  /// **'BLOCKCHAIN STATUS'**
  String get blockchainStatus;

  /// No description provided for @web3EngineTitle.
  ///
  /// In en, this message translates to:
  /// **'WEB3 ENGINE'**
  String get web3EngineTitle;

  /// No description provided for @finalityValid.
  ///
  /// In en, this message translates to:
  /// **'Finality: Valid'**
  String get finalityValid;

  /// No description provided for @nodeLatency.
  ///
  /// In en, this message translates to:
  /// **'Node Latency: 14ms'**
  String get nodeLatency;

  /// No description provided for @globalTrustActive.
  ///
  /// In en, this message translates to:
  /// **'Global Trade Trust: Active'**
  String get globalTrustActive;

  /// No description provided for @docVerification.
  ///
  /// In en, this message translates to:
  /// **'Doc Verification: 100%'**
  String get docVerification;

  /// No description provided for @digitalTrustEnabled.
  ///
  /// In en, this message translates to:
  /// **'Digital Trust: Enabled'**
  String get digitalTrustEnabled;

  /// No description provided for @terminateSession.
  ///
  /// In en, this message translates to:
  /// **'TERMINATE SESSION'**
  String get terminateSession;

  /// No description provided for @authorizedPartner.
  ///
  /// In en, this message translates to:
  /// **'AUTHORIZED PARTNER'**
  String get authorizedPartner;

  /// No description provided for @feature1Title.
  ///
  /// In en, this message translates to:
  /// **'International Payment'**
  String get feature1Title;

  /// No description provided for @feature1Line1.
  ///
  /// In en, this message translates to:
  /// **'Fast and Secure Global Transfers.'**
  String get feature1Line1;

  /// No description provided for @feature1Line2.
  ///
  /// In en, this message translates to:
  /// **'Using blockchain speed to move money instantly without the long waits of old banks.'**
  String get feature1Line2;

  /// No description provided for @feature2Title.
  ///
  /// In en, this message translates to:
  /// **'Local Currency Pricing'**
  String get feature2Title;

  /// No description provided for @feature2Line1.
  ///
  /// In en, this message translates to:
  /// **'Eliminate FX risk with quotes.'**
  String get feature2Line1;

  /// No description provided for @feature2Line2.
  ///
  /// In en, this message translates to:
  /// **'Trade directly in your own currency with guaranteed, locked-in exchange rates.'**
  String get feature2Line2;

  /// No description provided for @feature3Title.
  ///
  /// In en, this message translates to:
  /// **'Fortune 500 Network'**
  String get feature3Title;

  /// No description provided for @feature3Line1.
  ///
  /// In en, this message translates to:
  /// **'Verified global trade partners.'**
  String get feature3Line1;

  /// No description provided for @feature3Line2.
  ///
  /// In en, this message translates to:
  /// **'Our delivery promises are backed by the world\'s strongest Global 500 logistics companies.'**
  String get feature3Line2;

  /// No description provided for @feature4Title.
  ///
  /// In en, this message translates to:
  /// **'Smart Escrow'**
  String get feature4Title;

  /// No description provided for @feature4Line1.
  ///
  /// In en, this message translates to:
  /// **'Automated funds release via Web3.'**
  String get feature4Line1;

  /// No description provided for @feature4Line2.
  ///
  /// In en, this message translates to:
  /// **'The new digital replacement for LCs. Funds release instantly when document conditions are met.'**
  String get feature4Line2;

  /// No description provided for @feature5Title.
  ///
  /// In en, this message translates to:
  /// **'Door-to-Door (DDP)'**
  String get feature5Title;

  /// No description provided for @feature5Line1.
  ///
  /// In en, this message translates to:
  /// **'Complete logistics and tax pricing.'**
  String get feature5Line1;

  /// No description provided for @feature5Line2.
  ///
  /// In en, this message translates to:
  /// **'See all costs clearly, including customs and taxes, delivered directly to your door.'**
  String get feature5Line2;

  /// No description provided for @feature6Title.
  ///
  /// In en, this message translates to:
  /// **'Secure Authentication'**
  String get feature6Title;

  /// No description provided for @feature6Line1.
  ///
  /// In en, this message translates to:
  /// **'Vetting every partner and document.'**
  String get feature6Line1;

  /// No description provided for @feature6Line2.
  ///
  /// In en, this message translates to:
  /// **'We use Web3 technology to ensure every document and partner is 100% real and trusted.'**
  String get feature6Line2;

  /// No description provided for @logisticsCommand.
  ///
  /// In en, this message translates to:
  /// **'LOGISTICS COMMAND'**
  String get logisticsCommand;

  /// No description provided for @ddpAnalysisSub.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATED DDP CALCULATION & TRACKING'**
  String get ddpAnalysisSub;

  /// No description provided for @partnerXiangyu.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL 500 LOGISTICS PARTNER'**
  String get partnerXiangyu;

  /// No description provided for @landedCostTitle.
  ///
  /// In en, this message translates to:
  /// **'DDP LANDED COST ANALYSIS'**
  String get landedCostTitle;

  /// No description provided for @lockFxRate.
  ///
  /// In en, this message translates to:
  /// **'GENERATE QUOTE & LOCK FX RATE'**
  String get lockFxRate;

  /// No description provided for @routeIntelligence.
  ///
  /// In en, this message translates to:
  /// **'ROUTE INTELLIGENCE'**
  String get routeIntelligence;

  /// No description provided for @activeShipments.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE NODE SHIPMENTS'**
  String get activeShipments;

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

  /// No description provided for @mainGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String mainGreeting(String name);

  /// No description provided for @pillar1Title.
  ///
  /// In en, this message translates to:
  /// **'DDP LOGISTICS'**
  String get pillar1Title;

  /// No description provided for @pillar1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Global Landed Cost Engine'**
  String get pillar1Subtitle;

  /// No description provided for @pillar2Title.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL PAYMENTS'**
  String get pillar2Title;

  /// No description provided for @pillar2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Instant Settlement Protocol'**
  String get pillar2Subtitle;

  /// No description provided for @pillar3Title.
  ///
  /// In en, this message translates to:
  /// **'WEB3 TRUST'**
  String get pillar3Title;

  /// No description provided for @pillar3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Smart LC Replacement'**
  String get pillar3Subtitle;

  /// No description provided for @pillar4Title.
  ///
  /// In en, this message translates to:
  /// **'FOREX BRIDGE'**
  String get pillar4Title;

  /// No description provided for @pillar4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time Currency Pricing'**
  String get pillar4Subtitle;

  /// No description provided for @pillar5Title.
  ///
  /// In en, this message translates to:
  /// **'NETWORK HUB'**
  String get pillar5Title;

  /// No description provided for @pillar5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Verified Member Directory'**
  String get pillar5Subtitle;

  /// No description provided for @pillar6Title.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM SETTINGS'**
  String get pillar6Title;

  /// No description provided for @pillar6Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Terminal Configuration'**
  String get pillar6Subtitle;

  /// No description provided for @mainSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your cross-border trade'**
  String get mainSubtitle;

  /// No description provided for @coreQuoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Get DDP Quote'**
  String get coreQuoteTitle;

  /// No description provided for @coreSendTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Payment'**
  String get coreSendTitle;

  /// No description provided for @coreContractTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Escrow'**
  String get coreContractTitle;

  /// No description provided for @payTitle.
  ///
  /// In en, this message translates to:
  /// **'Pay Merchant'**
  String get payTitle;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @convertedAmount.
  ///
  /// In en, this message translates to:
  /// **'Converted Amount'**
  String get convertedAmount;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get method;

  /// No description provided for @payBtn.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payBtn;

  /// No description provided for @paySuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get paySuccess;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @toggleLang.
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get toggleLang;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

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

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get errorInvalidCredentials;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get errorUnexpected;

  /// No description provided for @trustPageTitle.
  ///
  /// In en, this message translates to:
  /// **'mBrics TRUST ENGINE (BETA)'**
  String get trustPageTitle;

  /// No description provided for @trustHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL TRUST.'**
  String get trustHeroTitle1;

  /// No description provided for @trustHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'THE ROADMAP.'**
  String get trustHeroTitle2;

  /// No description provided for @trustHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Designing the future of trade finance and LC replacement.'**
  String get trustHeroSlogan;

  /// No description provided for @trustSection1Title.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPMENT: SMART CONTRACTS'**
  String get trustSection1Title;

  /// No description provided for @trustSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'BEYOND THE LC'**
  String get trustSection1Feature1Title;

  /// No description provided for @trustSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Planned replacement for traditional bank LCs. Our upcoming Smart Contracts will act as a digital handshake to hold funds securely.'**
  String get trustSection1Feature1Desc;

  /// No description provided for @trustSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED DOCUMENTS'**
  String get trustSection1Feature2Title;

  /// No description provided for @trustSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'We are building an engine to automatically verify Bill of Lading and Invoices, allowing for instant trade acknowledgment without bank delays.'**
  String get trustSection1Feature2Desc;

  /// No description provided for @trustSection2Title.
  ///
  /// In en, this message translates to:
  /// **'HOW THE PROTOCOL WORKS'**
  String get trustSection2Title;

  /// No description provided for @trustSection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'SMART ESCROW'**
  String get trustSection2Feature1Title;

  /// No description provided for @trustSection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Under development: A secure digital vault where buyer funds stay locked until all shipping conditions are digitally met.'**
  String get trustSection2Feature1Desc;

  /// No description provided for @trustSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'INSTANT RELEASE'**
  String get trustSection2Feature2Title;

  /// No description provided for @trustSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Our goal: Once digital documents are verified, funds release immediately to the seller. No bank friction, just automated trust.'**
  String get trustSection2Feature2Desc;

  /// No description provided for @trustCtaButton.
  ///
  /// In en, this message translates to:
  /// **'VIEW PROTOCOL DEMO (COMING SOON)'**
  String get trustCtaButton;

  /// No description provided for @trustPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPMENT NOTICE'**
  String get trustPopupTitle;

  /// No description provided for @trustPopupAction.
  ///
  /// In en, this message translates to:
  /// **'ACKNOWLEDGE'**
  String get trustPopupAction;

  /// No description provided for @trustStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: PROTOCOL UNDER DEVELOPMENT'**
  String get trustStatusTag;

  /// No description provided for @trustEngineTag.
  ///
  /// In en, this message translates to:
  /// **'ENGINE: WEB3 ROADMAP v1.0'**
  String get trustEngineTag;

  /// No description provided for @trustPopupBody.
  ///
  /// In en, this message translates to:
  /// **'The Web3 Trust Engine is currently in its development phase. We are integrating blockchain nodes to replace traditional trade finance tools.'**
  String get trustPopupBody;

  /// No description provided for @ddpPageTitle.
  ///
  /// In en, this message translates to:
  /// **'DDP LOGISTICS COMMAND (PREVIEW)'**
  String get ddpPageTitle;

  /// No description provided for @ddpHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'DOOR TO DOOR.'**
  String get ddpHeroTitle1;

  /// No description provided for @ddpHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'THE VISION.'**
  String get ddpHeroTitle2;

  /// No description provided for @ddpHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Designing full transparency from factory to warehouse.'**
  String get ddpHeroSlogan;

  /// No description provided for @ddpSection1Title.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPMENT: LANDED COST'**
  String get ddpSection1Title;

  /// No description provided for @ddpSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'COST CALCULATION ENGINE'**
  String get ddpSection1Feature1Title;

  /// No description provided for @ddpSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'We are building an engine to calculate every cent of shipping, customs, and taxes upfront, removing the risk of hidden costs.'**
  String get ddpSection1Feature1Desc;

  /// No description provided for @ddpSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL 500 INTEGRATION'**
  String get ddpSection1Feature2Title;

  /// No description provided for @ddpSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Planned connectivity with the world\'s elite logistics nodes to ensure institutional-grade reliability for every shipment.'**
  String get ddpSection1Feature2Desc;

  /// No description provided for @ddpSection2Title.
  ///
  /// In en, this message translates to:
  /// **'HOW THE SYSTEM WILL WORK'**
  String get ddpSection2Title;

  /// No description provided for @ddpSection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'ROUTE INTELLIGENCE'**
  String get ddpSection2Feature1Title;

  /// No description provided for @ddpSection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'AI-driven selection process currently under development to find the most cost-effective trade lanes in the mBrics network.'**
  String get ddpSection2Feature1Desc;

  /// No description provided for @ddpSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'LOCKED QUOTES'**
  String get ddpSection2Feature2Title;

  /// No description provided for @ddpSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Our goal is to provide guaranteed rates that do not fluctuate, protecting you from unexpected port fees and price spikes.'**
  String get ddpSection2Feature2Desc;

  /// No description provided for @ddpCtaButton.
  ///
  /// In en, this message translates to:
  /// **'COST CALCULATOR (DEVELOPMENT PREVIEW)'**
  String get ddpCtaButton;

  /// No description provided for @ddpStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: LOGISTICS NODE SYNCING'**
  String get ddpStatusTag;

  /// No description provided for @ddpEngineTag.
  ///
  /// In en, this message translates to:
  /// **'ENGINE: DDP ROADMAP v1.0'**
  String get ddpEngineTag;

  /// No description provided for @ddpDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'The DDP Landed Cost Engine is currently integrating real-time customs data for Global 500 routes. This module is in the final development phase.'**
  String get ddpDemoNotice;

  /// No description provided for @networkPageTitle.
  ///
  /// In en, this message translates to:
  /// **'mBrics GLOBAL NETWORK'**
  String get networkPageTitle;

  /// No description provided for @networkHeroTitle1.
  ///
  /// In en, this message translates to:
  /// **'ELITE PARTNERS.'**
  String get networkHeroTitle1;

  /// No description provided for @networkHeroTitle2.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED TRUST.'**
  String get networkHeroTitle2;

  /// No description provided for @networkHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Building a directory of the world\'s most reliable trade nodes.'**
  String get networkHeroSlogan;

  /// No description provided for @networkSection1Title.
  ///
  /// In en, this message translates to:
  /// **'THE NETWORK VISION'**
  String get networkSection1Title;

  /// No description provided for @networkSection1Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL 500 LOGISTICS'**
  String get networkSection1Feature1Title;

  /// No description provided for @networkSection1Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'We are establishing partnerships with world-class logistics companies to ensure every shipment is handled by institutional-grade providers.'**
  String get networkSection1Feature1Desc;

  /// No description provided for @networkSection1Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED SUPPLIERS'**
  String get networkSection1Feature2Title;

  /// No description provided for @networkSection1Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Our roadmap includes a strict vetting process to ensure every merchant and supplier in the network is fully authenticated.'**
  String get networkSection1Feature2Desc;

  /// No description provided for @networkSection2Title.
  ///
  /// In en, this message translates to:
  /// **'HOW THE HUB WILL WORK'**
  String get networkSection2Title;

  /// No description provided for @networkSection2Feature1Title.
  ///
  /// In en, this message translates to:
  /// **'REPUTATION SCORES'**
  String get networkSection2Feature1Title;

  /// No description provided for @networkSection2Feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Under development: A blockchain-based rating system where trade history creates a transparent \'Trust Score\' for every partner.'**
  String get networkSection2Feature1Desc;

  /// No description provided for @networkSection2Feature2Title.
  ///
  /// In en, this message translates to:
  /// **'DIRECT CONNECT'**
  String get networkSection2Feature2Title;

  /// No description provided for @networkSection2Feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'The goal is to allow members to find and message verified partners directly within the mBrics secure environment.'**
  String get networkSection2Feature2Desc;

  /// No description provided for @networkCtaButton.
  ///
  /// In en, this message translates to:
  /// **'BROWSE DIRECTORY (PREVIEW)'**
  String get networkCtaButton;

  /// No description provided for @networkStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: PARTNER VETTING IN PROGRESS'**
  String get networkStatusTag;

  /// No description provided for @networkEngineTag.
  ///
  /// In en, this message translates to:
  /// **'DIRECTORY: ALPHA ROADMAP'**
  String get networkEngineTag;

  /// No description provided for @networkDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'The Global Member Directory is currently being populated with verified Fortune 500 partners. Access to the full list will be available in the next phase.'**
  String get networkDemoNotice;

  /// No description provided for @payPageTitle.
  ///
  /// In en, this message translates to:
  /// **'SETTLEMENT ENGINE'**
  String get payPageTitle;

  /// No description provided for @payHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL PAY PROTOCOL'**
  String get payHeroTitle;

  /// No description provided for @payHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Replacing bank-led trade finance with instant Web3 settlement.'**
  String get payHeroSlogan;

  /// No description provided for @payDescription.
  ///
  /// In en, this message translates to:
  /// **'Global Pay is the core of our engine. It replaces the slow Letter of Credit (LC) with a secure digital escrow. Instead of waiting weeks for bank approvals, our engine holds funds in a secure vault and releases them automatically once documents are verified.'**
  String get payDescription;

  /// No description provided for @payEscrowStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Escrow Vault Status'**
  String get payEscrowStatusLabel;

  /// No description provided for @payStatusTag.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPMENT: SYNCING'**
  String get payStatusTag;

  /// No description provided for @payFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED VAULT'**
  String get payFeature1Title;

  /// No description provided for @payFeature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Planned: Funds are secured on the blockchain, visible only to the buyer and seller.'**
  String get payFeature1Desc;

  /// No description provided for @payFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'AUTOMATED SETTLEMENT'**
  String get payFeature2Title;

  /// No description provided for @payFeature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Our roadmap includes auto-release triggers upon digital proof of cargo delivery.'**
  String get payFeature2Desc;

  /// No description provided for @payViewMapBtn.
  ///
  /// In en, this message translates to:
  /// **'VIEW TRADE VISUALIZER (BETA)'**
  String get payViewMapBtn;

  /// No description provided for @payCtaButton.
  ///
  /// In en, this message translates to:
  /// **'INITIALIZE SETTLEMENT'**
  String get payCtaButton;

  /// No description provided for @payDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'The Settlement Engine is currently in its core development phase. Blockchain escrow and instant payout features are part of the upcoming Q1 roadmap.'**
  String get payDemoNotice;

  /// No description provided for @forexPageTitle.
  ///
  /// In en, this message translates to:
  /// **'FOREX BRIDGE'**
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
  /// **'We eliminate the guesswork in global trade. By showing all prices in your local currency in real-time, we provide total transparency. When you start a trade, our Web3 engine is designed to \'lock\' this rate into a Smart Contract, so market changes won\'t affect your price.'**
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
  /// **'The Web3 Rate Locking protocol is currently in the testing phase. Real-time institutional feeds are active, and contract-locking will be live in the next update.'**
  String get forexDemoNotice;

  /// No description provided for @visualPageTitle.
  ///
  /// In en, this message translates to:
  /// **'TRADE VISUALIZER'**
  String get visualPageTitle;

  /// No description provided for @visualHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'THE LIVE TRADE MAP'**
  String get visualHeroTitle;

  /// No description provided for @visualHeroSlogan.
  ///
  /// In en, this message translates to:
  /// **'Replacing manual emails with a verified digital timeline.'**
  String get visualHeroSlogan;

  /// No description provided for @visualDescription.
  ///
  /// In en, this message translates to:
  /// **'Our Web3 Engine removes the guesswork. Every milestone—from factory to port—is verified on the blockchain. You see exactly where your goods and your money are in real-time.'**
  String get visualDescription;

  /// No description provided for @visualStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Contract Verified'**
  String get visualStep1Title;

  /// No description provided for @visualStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Digital signature secured on blockchain.'**
  String get visualStep1Desc;

  /// No description provided for @visualStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Forex Rate Locked'**
  String get visualStep2Title;

  /// No description provided for @visualStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Rate secured by the Web3 Engine.'**
  String get visualStep2Desc;

  /// No description provided for @visualStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Goods Dispatched'**
  String get visualStep3Title;

  /// No description provided for @visualStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'DDP Logistics tracking active.'**
  String get visualStep3Desc;

  /// No description provided for @visualStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Port Arrival'**
  String get visualStep4Title;

  /// No description provided for @visualStep4Desc.
  ///
  /// In en, this message translates to:
  /// **'Planned: Awaiting digital document verification.'**
  String get visualStep4Desc;

  /// No description provided for @visualStep5Title.
  ///
  /// In en, this message translates to:
  /// **'Global Pay Release'**
  String get visualStep5Title;

  /// No description provided for @visualStep5Desc.
  ///
  /// In en, this message translates to:
  /// **'Goal: Automatic settlement on delivery proof.'**
  String get visualStep5Desc;

  /// No description provided for @visualCtaButton.
  ///
  /// In en, this message translates to:
  /// **'REFRESH LIVE STATUS'**
  String get visualCtaButton;

  /// No description provided for @visualStatusTag.
  ///
  /// In en, this message translates to:
  /// **'STATUS: MAP ENGINE SYNCING'**
  String get visualStatusTag;

  /// No description provided for @visualEngineTag.
  ///
  /// In en, this message translates to:
  /// **'VISUALIZER: ROADMAP v1.0'**
  String get visualEngineTag;

  /// No description provided for @visualDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'The Trade Visualizer is currently integrating real-time GPS and blockchain event logs. This tracking module is in the final development phase.'**
  String get visualDemoNotice;
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
