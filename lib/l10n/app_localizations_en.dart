// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'mBrics Platform';

  @override
  String get welcomeTitle => 'Welcome to mBrics';

  @override
  String get welcome => 'Welcome to mBrics';

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
  String get registrationSuccess =>
      'Account created successfully. Please verify your email and log in.';

  @override
  String registrationFailed(String error) {
    return 'Registration failed: $error';
  }

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
  String get escrow => 'Create Escrow Contract';

  @override
  String get escrowTitle => 'Escrow';

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
  String get hintTitle => 'Hint';

  @override
  String get hintSubtitle =>
      'This page is a payment demo, not connected to real payment channels.';

  @override
  String get noData => 'No data';

  @override
  String get method => 'Payment Method';

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
