// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'mBrics 平台';

  @override
  String get welcomeTitle => '欢迎来到 mBrics';

  @override
  String get welcome => '欢迎来到 mBrics';

  @override
  String get loginTitle => '登录';

  @override
  String get login => '登录';

  @override
  String get loginBtn => '登录';

  @override
  String get register => '注册';

  @override
  String get registerTitle => '注册';

  @override
  String get createAccount => '创建账户';

  @override
  String get alreadyHaveAccount => '已有账户？登录';

  @override
  String get goToLogin => '已有账户？登录';

  @override
  String get noAccountRegister => '没有账户？注册';

  @override
  String get alreadyRegistered => '已经注册？点击这里登录';

  @override
  String get username => '用户名';

  @override
  String get email => '电子邮箱';

  @override
  String get password => '密码';

  @override
  String get fullName => '姓名';

  @override
  String get phoneOptional => '电话（可选）';

  @override
  String get companyOptional => '公司（可选）';

  @override
  String get loginHint => '演示登录：用户名 = mbrics, 密码 = mbrics';

  @override
  String loginFailed(String error) {
    return '登录失败：$error';
  }

  @override
  String get errorInvalidCredentials => '电子邮箱或密码不正确，请重试。';

  @override
  String get errorUserNotFound => '没有找到该电子邮箱的账户。要注册吗？';

  @override
  String get errorEmailTaken => '该电子邮箱已注册，请尝试登录。';

  @override
  String get errorWeakPassword => '密码必须至少包含8个字符。';

  @override
  String get errorNetwork => '无法连接服务器，请检查网络后重试。';

  @override
  String get errorTooManyAttempts => '登录失败次数过多，请稍后再试。';

  @override
  String get errorUnexpected => '发生未知错误，请稍后再试。';

  @override
  String get errorInvalidEmailFormat => '请输入有效的电子邮箱地址。';

  @override
  String get errorInvalidPhone => '请输入有效的电话号码。';

  @override
  String get registrationSuccess => '账户创建成功。请验证邮箱并登录。';

  @override
  String registrationFailed(String error) {
    return '注册失败：$error';
  }

  @override
  String get ddp => 'DDP 平台';

  @override
  String get ddp_subtitle => '透明的到岸成本报价';

  @override
  String get originCountry => '起运国';

  @override
  String get destinationCountry => '目的国';

  @override
  String get incoterm => '贸易术语';

  @override
  String get shipmentType => '运输类型';

  @override
  String get containerType => '集装箱类型';

  @override
  String get volume => '体积 (立方米)';

  @override
  String get goodsValue => '货物价值';

  @override
  String get hsCode => 'HS 编码';

  @override
  String get weight => '重量 (公斤)';

  @override
  String get generateQuote => '生成报价';

  @override
  String get forex => '外汇汇率';

  @override
  String get forex_subtitle => '美元, 人民币, 南非兰特';

  @override
  String get usdToCny => '美元 → 人民币';

  @override
  String get usdToZar => '美元 → 南非兰特';

  @override
  String get cnyToZar => '人民币 → 南非兰特';

  @override
  String get currency => '货币';

  @override
  String get amount => '金额';

  @override
  String get convertedAmount => '转换金额';

  @override
  String get escrow => '创建托管合同';

  @override
  String get escrowTitle => '托管';

  @override
  String get pay => '支付给某人';

  @override
  String get payTitle => '支付功能';

  @override
  String get recipientLabel => '收款人姓名';

  @override
  String get amountLabel => '金额';

  @override
  String get confirmPayment => '确认支付';

  @override
  String get payBtn => '支付';

  @override
  String get paySuccess => '支付成功';

  @override
  String paymentConfirmation(String recipient, String amount) {
    return '支付演示：$recipient 收到 $amount';
  }

  @override
  String get hintTitle => '提示';

  @override
  String get hintSubtitle => '此页面为支付演示，不连接真实支付渠道。';

  @override
  String get noData => '没有数据';

  @override
  String get method => '支付方式';

  @override
  String get dashboardTitle => '仪表盘';

  @override
  String get homeTitle => '主菜单';

  @override
  String get settings => '设置';

  @override
  String get preferredCurrency => '首选货币';

  @override
  String get apiSource => 'API 来源';

  @override
  String get logout => '退出登录';

  @override
  String get darkMode => '深色模式';

  @override
  String get notifications => '通知';

  @override
  String get navigation => '导航';

  @override
  String get toggleLang => 'English';

  @override
  String get terms => '条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get editProfile => '编辑资料';

  @override
  String footerText(String year) {
    return '© $year mBrics';
  }
}
