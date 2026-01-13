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
    Locale('zh')
  ];

  /// No description provided for @section_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome page strings'**
  String get section_welcome;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'mBrics Platform'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to mBrics'**
  String get welcomeTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to mBrics'**
  String get welcome;

  /// No description provided for @section_login.
  ///
  /// In en, this message translates to:
  /// **'Login page strings'**
  String get section_login;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginBtn.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginBtn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// No description provided for @globalTradeSlogan.
  ///
  /// In en, this message translates to:
  /// **'Global trade, secured by blockchain'**
  String get globalTradeSlogan;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Built for global trade. Designed for trust.'**
  String get loginSubtitle;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get alreadyHaveAccount;

  /// No description provided for @goToLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get goToLogin;

  /// No description provided for @noAccountRegister.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Register'**
  String get noAccountRegister;

  /// No description provided for @alreadyRegisteredLogin.
  ///
  /// In en, this message translates to:
  /// **'Already registered? Log in'**
  String get alreadyRegisteredLogin;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Already registered? Log in'**
  String get alreadyRegistered;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get phoneOptional;

  /// No description provided for @companyOptional.
  ///
  /// In en, this message translates to:
  /// **'Company (optional)'**
  String get companyOptional;

  /// No description provided for @loginHint.
  ///
  /// In en, this message translates to:
  /// **'Demo login: username = mbrics, password = mbrics'**
  String get loginHint;

  /// Shown when login fails
  ///
  /// In en, this message translates to:
  /// **'Login failed: {error}'**
  String loginFailed(String error);

  /// No description provided for @section_errors.
  ///
  /// In en, this message translates to:
  /// **'Error messages'**
  String get section_errors;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password. Please try again.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No account exists with this email. Would you like to register instead?'**
  String get errorUserNotFound;

  /// No description provided for @errorEmailTaken.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Try logging in instead.'**
  String get errorEmailTaken;

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get errorWeakPassword;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t reach the server. Check your connection and try again.'**
  String get errorNetwork;

  /// No description provided for @errorTooManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many failed login attempts. Please wait a few minutes before trying again.'**
  String get errorTooManyAttempts;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later.'**
  String get errorUnexpected;

  /// No description provided for @errorInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get errorInvalidEmailFormat;

  /// No description provided for @errorInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get errorInvalidPhone;

  /// No description provided for @section_registration.
  ///
  /// In en, this message translates to:
  /// **'Registration messages'**
  String get section_registration;

  /// No description provided for @errorNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get errorNameRequired;

  /// No description provided for @errorEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get errorEmailRequired;

  /// No description provided for @errorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get errorPasswordRequired;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordHelper;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @countrySouthAfrica.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get countrySouthAfrica;

  /// No description provided for @countryChina.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get countryChina;

  /// No description provided for @countryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get countryOther;

  /// No description provided for @countryCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Country Code (e.g. +44)'**
  String get countryCodeHint;

  /// No description provided for @registrationSlogan.
  ///
  /// In en, this message translates to:
  /// **'Built for global trade. Designed for trust.'**
  String get registrationSlogan;

  /// No description provided for @registrationFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'Secure Identity'**
  String get registrationFeature1Title;

  /// No description provided for @registrationFeature1Line1.
  ///
  /// In en, this message translates to:
  /// **'Your details are encrypted end-to-end.'**
  String get registrationFeature1Line1;

  /// No description provided for @registrationFeature1Line2.
  ///
  /// In en, this message translates to:
  /// **'No leaks, no compromises.'**
  String get registrationFeature1Line2;

  /// No description provided for @registrationFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'Global Compliance'**
  String get registrationFeature2Title;

  /// No description provided for @registrationFeature2Line1.
  ///
  /// In en, this message translates to:
  /// **'Meets international KYC/AML standards.'**
  String get registrationFeature2Line1;

  /// No description provided for @registrationFeature2Line2.
  ///
  /// In en, this message translates to:
  /// **'Trusted by regulators worldwide.'**
  String get registrationFeature2Line2;

  /// No description provided for @registrationFeature3Title.
  ///
  /// In en, this message translates to:
  /// **'Instant Verification'**
  String get registrationFeature3Title;

  /// No description provided for @registrationFeature3Line1.
  ///
  /// In en, this message translates to:
  /// **'Accounts verified in seconds.'**
  String get registrationFeature3Line1;

  /// No description provided for @registrationFeature3Line2.
  ///
  /// In en, this message translates to:
  /// **'No waiting, no delays.'**
  String get registrationFeature3Line2;

  /// No description provided for @registrationFeature4Title.
  ///
  /// In en, this message translates to:
  /// **'Smart Contracts Ready'**
  String get registrationFeature4Title;

  /// No description provided for @registrationFeature4Line1.
  ///
  /// In en, this message translates to:
  /// **'Future-proof onboarding.'**
  String get registrationFeature4Line1;

  /// No description provided for @registrationFeature4Line2.
  ///
  /// In en, this message translates to:
  /// **'Seamless integration with blockchain escrow.'**
  String get registrationFeature4Line2;

  /// No description provided for @registrationFeature5Title.
  ///
  /// In en, this message translates to:
  /// **'Cross-Border Friendly'**
  String get registrationFeature5Title;

  /// No description provided for @registrationFeature5Line1.
  ///
  /// In en, this message translates to:
  /// **'Register once, trade globally.'**
  String get registrationFeature5Line1;

  /// No description provided for @registrationFeature5Line2.
  ///
  /// In en, this message translates to:
  /// **'Supports multiple currencies and regions.'**
  String get registrationFeature5Line2;

  /// No description provided for @registrationFeature6Title.
  ///
  /// In en, this message translates to:
  /// **'Audit Trail Transparency'**
  String get registrationFeature6Title;

  /// No description provided for @registrationFeature6Line1.
  ///
  /// In en, this message translates to:
  /// **'Every registration logged immutably.'**
  String get registrationFeature6Line1;

  /// No description provided for @registrationFeature6Line2.
  ///
  /// In en, this message translates to:
  /// **'Proof of trust for partners and investors.'**
  String get registrationFeature6Line2;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully. Please verify your email and log in.'**
  String get registrationSuccess;

  /// Shown when registration fails
  ///
  /// In en, this message translates to:
  /// **'Registration failed: {error}'**
  String registrationFailed(String error);

  /// No description provided for @section_login_features.
  ///
  /// In en, this message translates to:
  /// **'Login screen feature highlights'**
  String get section_login_features;

  /// No description provided for @feature1Title.
  ///
  /// In en, this message translates to:
  /// **'Trade in Local Currency'**
  String get feature1Title;

  /// No description provided for @feature1Line1.
  ///
  /// In en, this message translates to:
  /// **'Real-time quotes in Rand, Yuan, and more.'**
  String get feature1Line1;

  /// No description provided for @feature1Line2.
  ///
  /// In en, this message translates to:
  /// **'Transparent landed costs, no hidden conversions.'**
  String get feature1Line2;

  /// No description provided for @feature2Title.
  ///
  /// In en, this message translates to:
  /// **'Instant International Transfers'**
  String get feature2Title;

  /// No description provided for @feature2Line1.
  ///
  /// In en, this message translates to:
  /// **'Instant money transfers in your currency.'**
  String get feature2Line1;

  /// No description provided for @feature2Line2.
  ///
  /// In en, this message translates to:
  /// **'Backed by central banks for safety.'**
  String get feature2Line2;

  /// No description provided for @feature3Title.
  ///
  /// In en, this message translates to:
  /// **'Blockchain Escrow - Policed'**
  String get feature3Title;

  /// No description provided for @feature3Line1.
  ///
  /// In en, this message translates to:
  /// **'Smart contracts enforce trust automatically.'**
  String get feature3Line1;

  /// No description provided for @feature3Line2.
  ///
  /// In en, this message translates to:
  /// **'All transactions policed by blockchain oversight.'**
  String get feature3Line2;

  /// No description provided for @feature4Title.
  ///
  /// In en, this message translates to:
  /// **'Trusted Logistics'**
  String get feature4Title;

  /// No description provided for @feature4Line1.
  ///
  /// In en, this message translates to:
  /// **'Delivered by Global 500 providers.'**
  String get feature4Line1;

  /// No description provided for @feature4Line2.
  ///
  /// In en, this message translates to:
  /// **'State-owned carriers ensure reliability.'**
  String get feature4Line2;

  /// No description provided for @feature5Title.
  ///
  /// In en, this message translates to:
  /// **'Oversight & Security'**
  String get feature5Title;

  /// No description provided for @feature5Line1.
  ///
  /// In en, this message translates to:
  /// **'Overseen by the Bank of China.'**
  String get feature5Line1;

  /// No description provided for @feature5Line2.
  ///
  /// In en, this message translates to:
  /// **'The watchdog of global trade.'**
  String get feature5Line2;

  /// No description provided for @feature6Title.
  ///
  /// In en, this message translates to:
  /// **'No More Costly L/Cs'**
  String get feature6Title;

  /// No description provided for @feature6Line1.
  ///
  /// In en, this message translates to:
  /// **'Replace slow Letters of Credit.'**
  String get feature6Line1;

  /// No description provided for @feature6Line2.
  ///
  /// In en, this message translates to:
  /// **'Instant agreements, zero paperwork.'**
  String get feature6Line2;

  /// No description provided for @section_ddp.
  ///
  /// In en, this message translates to:
  /// **'DDP Platform strings'**
  String get section_ddp;

  /// No description provided for @ddp.
  ///
  /// In en, this message translates to:
  /// **'DDP Platform'**
  String get ddp;

  /// No description provided for @ddp_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Transparent landed cost quoting'**
  String get ddp_subtitle;

  /// No description provided for @originCountry.
  ///
  /// In en, this message translates to:
  /// **'Origin Country'**
  String get originCountry;

  /// No description provided for @destinationCountry.
  ///
  /// In en, this message translates to:
  /// **'Destination Country'**
  String get destinationCountry;

  /// No description provided for @incoterm.
  ///
  /// In en, this message translates to:
  /// **'Incoterm'**
  String get incoterm;

  /// No description provided for @shipmentType.
  ///
  /// In en, this message translates to:
  /// **'Shipment Type'**
  String get shipmentType;

  /// No description provided for @containerType.
  ///
  /// In en, this message translates to:
  /// **'Container Type'**
  String get containerType;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume (CBM)'**
  String get volume;

  /// No description provided for @goodsValue.
  ///
  /// In en, this message translates to:
  /// **'Goods Value'**
  String get goodsValue;

  /// No description provided for @hsCode.
  ///
  /// In en, this message translates to:
  /// **'HS Code'**
  String get hsCode;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weight;

  /// No description provided for @generateQuote.
  ///
  /// In en, this message translates to:
  /// **'Generate Quote'**
  String get generateQuote;

  /// No description provided for @section_forex.
  ///
  /// In en, this message translates to:
  /// **'Forex strings'**
  String get section_forex;

  /// No description provided for @forex.
  ///
  /// In en, this message translates to:
  /// **'Forex Exchange Rates'**
  String get forex;

  /// No description provided for @forex_subtitle.
  ///
  /// In en, this message translates to:
  /// **'USD, RMB, ZAR'**
  String get forex_subtitle;

  /// No description provided for @usdToCny.
  ///
  /// In en, this message translates to:
  /// **'USD → CNY'**
  String get usdToCny;

  /// No description provided for @usdToZar.
  ///
  /// In en, this message translates to:
  /// **'USD → ZAR'**
  String get usdToZar;

  /// No description provided for @cnyToZar.
  ///
  /// In en, this message translates to:
  /// **'CNY → ZAR'**
  String get cnyToZar;

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

  /// No description provided for @section_escrow.
  ///
  /// In en, this message translates to:
  /// **'Escrow strings'**
  String get section_escrow;

  /// No description provided for @escrow.
  ///
  /// In en, this message translates to:
  /// **'Create Escrow Contract'**
  String get escrow;

  /// No description provided for @escrowTitle.
  ///
  /// In en, this message translates to:
  /// **'Escrow'**
  String get escrowTitle;

  /// No description provided for @section_pay.
  ///
  /// In en, this message translates to:
  /// **'Pay strings'**
  String get section_pay;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay Someone'**
  String get pay;

  /// No description provided for @payTitle.
  ///
  /// In en, this message translates to:
  /// **'Pay Feature'**
  String get payTitle;

  /// No description provided for @recipientLabel.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get recipientLabel;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @confirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get confirmPayment;

  /// No description provided for @payBtn.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get payBtn;

  /// No description provided for @paySuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get paySuccess;

  /// Confirmation message after submitting payment
  ///
  /// In en, this message translates to:
  /// **'Payment demo: {recipient} received {amount}'**
  String paymentConfirmation(String recipient, String amount);

  /// No description provided for @section_misc.
  ///
  /// In en, this message translates to:
  /// **'Miscellaneous strings'**
  String get section_misc;

  /// No description provided for @hintTitle.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hintTitle;

  /// No description provided for @hintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This page is a payment demo, not connected to real payment channels.'**
  String get hintSubtitle;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get method;

  /// No description provided for @section_navigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation strings'**
  String get section_navigation;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get homeTitle;

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

  /// No description provided for @navigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get navigation;

  /// No description provided for @toggleLang.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get toggleLang;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get terms;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Footer copyright with year
  ///
  /// In en, this message translates to:
  /// **'© {year} mBrics'**
  String footerText(String year);
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
      'that was used.');
}
