// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get section_welcome => 'Welcome page strings';

  @override
  String get appTitle => 'mBrics Platform';

  @override
  String get welcomeTitle => 'Welcome to mBrics';

  @override
  String get welcome => 'Welcome to mBrics';

  @override
  String get section_login => 'Login page strings';

  @override
  String get loginTitle => 'Login';

  @override
  String get login => 'Login';

  @override
  String get loginBtn => 'Login';

  @override
  String get register => 'Register';

  @override
  String get registerTitle => 'Register';

  @override
  String get createAccount => 'Create account';

  @override
  String get alreadyHaveAccount => 'Already have an account? Log in';

  @override
  String get goToLogin => 'Already have an account? Log in';

  @override
  String get noAccountRegister => 'Don\'t have an account? Register';

  @override
  String get alreadyRegistered => 'Already registered? Log in here';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneOptional => 'Phone (optional)';

  @override
  String get companyOptional => 'Company (optional)';

  @override
  String get loginHint => 'Demo login: username = mbrics, password = mbrics';

  @override
  String loginFailed(String error) {
    return 'Login failed: $error';
  }

  @override
  String get section_errors => 'Error messages';

  @override
  String get errorInvalidCredentials =>
      'Incorrect email or password. Please try again.';

  @override
  String get errorUserNotFound =>
      'No account exists with this email. Would you like to register instead?';

  @override
  String get errorEmailTaken =>
      'This email is already registered. Try logging in instead.';

  @override
  String get errorWeakPassword => 'Password must be at least 8 characters.';

  @override
  String get errorNetwork =>
      'We couldn’t reach the server. Check your connection and try again.';

  @override
  String get errorTooManyAttempts =>
      'Too many failed login attempts. Please wait a few minutes before trying again.';

  @override
  String get errorUnexpected => 'Something went wrong. Please try again later.';

  @override
  String get errorInvalidEmailFormat => 'Please enter a valid email address.';

  @override
  String get errorInvalidPhone => 'Please enter a valid phone number.';

  @override
  String get section_registration => 'Registration messages';

  @override
  String get registrationSuccess =>
      'Account created successfully. Please verify your email and log in.';

  @override
  String registrationFailed(String error) {
    return 'Registration failed: $error';
  }

  @override
  String get section_login_screen_slogans => 'Login screen slogans';

  @override
  String get globalTradeSlogan => 'Global trade, secured by blockchain';

  @override
  String get loginSubtitle => 'Built for global trade. Designed for trust.';

  @override
  String get section_login_features => 'Login screen feature highlights';

  @override
  String get feature1Title => 'Trade in Local Currency';

  @override
  String get feature1Line1 => 'Real-time quotes in Rand, Yuan, and more.';

  @override
  String get feature1Line2 =>
      'Transparent landed costs, no hidden conversions.';

  @override
  String get feature2Title => 'Instant International Transfers';

  @override
  String get feature2Line1 => 'Instant money transfers in your currency.';

  @override
  String get feature2Line2 => 'Backed by central banks for safety.';

  @override
  String get feature3Title => 'Blockchain Escrow - Policed';

  @override
  String get feature3Line1 => 'Smart contracts enforce trust automatically.';

  @override
  String get feature3Line2 =>
      'All transactions policed by blockchain oversight.';

  @override
  String get feature4Title => 'Trusted Logistics';

  @override
  String get feature4Line1 => 'Delivered by Global 500 providers.';

  @override
  String get feature4Line2 => 'State-owned carriers ensure reliability.';

  @override
  String get feature5Title => 'Oversight & Security';

  @override
  String get feature5Line1 => 'Overseen by the Bank of China.';

  @override
  String get feature5Line2 => 'The watchdog of global trade.';

  @override
  String get feature6Title => 'No More Costly L/Cs';

  @override
  String get feature6Line1 => 'Replace slow Letters of Credit.';

  @override
  String get feature6Line2 => 'Instant agreements, zero paperwork.';

  @override
  String get section_ddp => 'DDP Platform strings';

  @override
  String get ddp => 'DDP Platform';

  @override
  String get ddp_subtitle => 'Transparent landed cost quoting';

  @override
  String get originCountry => 'Origin Country';

  @override
  String get destinationCountry => 'Destination Country';

  @override
  String get incoterm => 'Incoterm';

  @override
  String get shipmentType => 'Shipment Type';

  @override
  String get containerType => 'Container Type';

  @override
  String get volume => 'Volume (CBM)';

  @override
  String get goodsValue => 'Goods Value';

  @override
  String get hsCode => 'HS Code';

  @override
  String get weight => 'Weight (kg)';

  @override
  String get generateQuote => 'Generate Quote';

  @override
  String get section_forex => 'Forex strings';

  @override
  String get forex => 'Forex Exchange Rates';

  @override
  String get forex_subtitle => 'USD, RMB, ZAR';

  @override
  String get usdToCny => 'USD → CNY';

  @override
  String get usdToZar => 'USD → ZAR';

  @override
  String get cnyToZar => 'CNY → ZAR';

  @override
  String get currency => 'Currency';

  @override
  String get amount => 'Amount';

  @override
  String get convertedAmount => 'Converted Amount';

  @override
  String get section_escrow => 'Escrow strings';

  @override
  String get escrow => 'Create Escrow Contract';

  @override
  String get escrowTitle => 'Escrow';

  @override
  String get section_pay => 'Pay strings';

  @override
  String get pay => 'Pay Someone';

  @override
  String get payTitle => 'Pay Feature';

  @override
  String get recipientLabel => 'Recipient Name';

  @override
  String get amountLabel => 'Amount';

  @override
  String get confirmPayment => 'Confirm Payment';

  @override
  String get payBtn => 'Pay';

  @override
  String get paySuccess => 'Payment Successful';

  @override
  String paymentConfirmation(String recipient, String amount) {
    return 'Payment demo: $recipient received $amount';
  }

  @override
  String get section_misc => 'Miscellaneous strings';

  @override
  String get hintTitle => 'Hint';

  @override
  String get hintSubtitle =>
      'This page is a payment demo, not connected to real payment channels.';

  @override
  String get noData => 'No data';

  @override
  String get method => 'Payment Method';

  @override
  String get section_navigation => 'Navigation strings';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get homeTitle => 'Main Menu';

  @override
  String get settings => 'Settings';

  @override
  String get preferredCurrency => 'Preferred Currency';

  @override
  String get apiSource => 'API Source';

  @override
  String get logout => 'Logout';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get notifications => 'Notifications';

  @override
  String get navigation => 'Navigation';

  @override
  String get toggleLang => '中文';

  @override
  String get terms => 'Terms';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String footerText(String year) {
    return '© $year mBrics';
  }
}
