// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to mBrics';

  @override
  String get ddp => 'DDP Platform';

  @override
  String get ddp_subtitle => 'Transparent landed cost quoting';

  @override
  String get forex => 'Forex Exchange Rates';

  @override
  String get forex_subtitle => 'USD, RMB, ZAR';

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
  String get hintTitle => 'Hint';

  @override
  String get hintSubtitle =>
      'This page is a payment demo, not connected to real payment channels.';

  @override
  String get loginTitle => 'Login';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get loginBtn => 'Login';

  @override
  String get toggleLang => '中文';

  @override
  String get invalidCredentials => 'Invalid credentials';

  @override
  String get loginHint => 'Demo login: username = mbrics, password = mbrics';

  @override
  String loginFailed(String error) {
    return 'Login failed: $error';
  }

  @override
  String paymentConfirmation(String recipient, String amount) {
    return 'Payment demo: $recipient received $amount';
  }

  @override
  String get noData => 'No data';

  @override
  String get currency => 'Currency';

  @override
  String get amount => 'Amount';

  @override
  String get convertedAmount => 'Converted Amount';

  @override
  String get method => 'Payment Method';

  @override
  String get payBtn => 'Pay';

  @override
  String get paySuccess => 'Payment Successful';

  @override
  String get usdToCny => 'USD → CNY';

  @override
  String get usdToZar => 'USD → ZAR';

  @override
  String get cnyToZar => 'CNY → ZAR';

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
  String get registerTitle => 'Register';

  @override
  String get fullName => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get createAccount => 'Create account';

  @override
  String get alreadyHaveAccount => 'Already have an account? Log in';

  @override
  String get goToLogin => 'Already have an account? Log in';

  @override
  String get noAccountRegister => 'Don\'t have an account? Register';

  @override
  String get phoneOptional => 'Phone (optional)';

  @override
  String get companyOptional => 'Company (optional)';

  @override
  String get terms => 'Terms';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get registrationSuccess =>
      'Account created successfully. Please verify your email and log in.';

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
  String get logout => 'Logout';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get notifications => 'Notifications';

  @override
  String get appTitle => 'mBrics Platform';

  @override
  String get navigation => 'Navigation';

  @override
  String footerText(String year) {
    return '© $year mBrics';
  }
}
