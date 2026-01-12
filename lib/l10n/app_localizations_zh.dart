// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get section_welcome => 'Welcome page strings';

  @override
  String get appTitle => 'mBrics 平台';

  @override
  String get welcomeTitle => '欢迎来到 mBrics';

  @override
  String get welcome => '欢迎来到 mBrics';

  @override
  String get section_login => 'Login page strings';

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
  String get noAccountRegister => '没有账户？立即注册';

  @override
  String get alreadyRegistered => '已经注册？在此登录';

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
  String get loginHint => '演示登录：用户名 = mbrics，密码 = mbrics';

  @override
  String loginFailed(String error) {
    return '登录失败：$error';
  }

  @override
  String get section_errors => 'Error messages';

  @override
  String get errorInvalidCredentials => '邮箱或密码错误，请重试。';

  @override
  String get errorUserNotFound => '该邮箱未注册。要立即注册吗？';

  @override
  String get errorEmailTaken => '该邮箱已注册，请尝试登录。';

  @override
  String get errorWeakPassword => '密码至少需要 8 个字符。';

  @override
  String get errorNetwork => '无法连接服务器，请检查网络后重试。';

  @override
  String get errorTooManyAttempts => '登录失败次数过多，请稍后再试。';

  @override
  String get errorUnexpected => '出现问题，请稍后再试。';

  @override
  String get errorInvalidEmailFormat => '请输入有效的邮箱地址。';

  @override
  String get errorInvalidPhone => '请输入有效的电话号码。';

  @override
  String get section_registration => 'Registration messages';

  @override
  String get registrationSuccess => '账户创建成功。请验证邮箱后登录。';

  @override
  String registrationFailed(String error) {
    return '注册失败：$error';
  }

  @override
  String get section_login_screen_slogans => 'Login screen slogans';

  @override
  String get globalTradeSlogan => '全球贸易，由区块链保障';

  @override
  String get loginSubtitle => '为全球贸易而建，为信任而生。';

  @override
  String get section_login_features => 'Login screen feature highlights';

  @override
  String get feature1Title => '本地货币交易';

  @override
  String get feature1Line1 => '实时报价：兰特、人民币等。';

  @override
  String get feature1Line2 => '透明到岸成本，无隐藏换算。';

  @override
  String get feature2Title => '即时国际转账';

  @override
  String get feature2Line1 => '即时到账，支持本币。';

  @override
  String get feature2Line2 => '由央行保障安全。';

  @override
  String get feature3Title => '区块链托管 - 监管';

  @override
  String get feature3Line1 => '智能合约自动执行信任。';

  @override
  String get feature3Line2 => '所有交易由区块链监管。';

  @override
  String get feature4Title => '可信物流';

  @override
  String get feature4Line1 => '由全球 500 强提供服务。';

  @override
  String get feature4Line2 => '国有承运人确保可靠性。';

  @override
  String get feature5Title => '监管与安全';

  @override
  String get feature5Line1 => '由中国银行监管。';

  @override
  String get feature5Line2 => '全球贸易的守护者。';

  @override
  String get feature6Title => '不再需要昂贵的信用证';

  @override
  String get feature6Line1 => '替代缓慢的信用证流程。';

  @override
  String get feature6Line2 => '即时协议，无需纸质文件。';

  @override
  String get section_ddp => 'DDP Platform strings';

  @override
  String get ddp => 'DDP 平台';

  @override
  String get ddp_subtitle => '透明的到岸成本报价';

  @override
  String get originCountry => '起运国';

  @override
  String get destinationCountry => '目的国';

  @override
  String get incoterm => '国际贸易术语';

  @override
  String get shipmentType => '运输类型';

  @override
  String get containerType => '集装箱类型';

  @override
  String get volume => '体积 (立方米)';

  @override
  String get goodsValue => '货值';

  @override
  String get hsCode => 'HS 编码';

  @override
  String get weight => '重量 (公斤)';

  @override
  String get generateQuote => '生成报价';

  @override
  String get section_forex => 'Forex strings';

  @override
  String get forex => '外汇汇率';

  @override
  String get forex_subtitle => '美元、人民币、兰特';

  @override
  String get usdToCny => '美元 → 人民币';

  @override
  String get usdToZar => '美元 → 兰特';

  @override
  String get cnyToZar => '人民币 → 兰特';

  @override
  String get currency => '货币';

  @override
  String get amount => '金额';

  @override
  String get convertedAmount => '换算金额';

  @override
  String get section_escrow => 'Escrow strings';

  @override
  String get escrow => '创建托管合约';

  @override
  String get escrowTitle => '托管';

  @override
  String get section_pay => 'Pay strings';

  @override
  String get pay => '付款';

  @override
  String get payTitle => '支付功能';

  @override
  String get recipientLabel => '收款人姓名';

  @override
  String get amountLabel => '金额';

  @override
  String get confirmPayment => '确认付款';

  @override
  String get payBtn => '支付';

  @override
  String get paySuccess => '付款成功';

  @override
  String paymentConfirmation(String recipient, String amount) {
    return '支付演示：$recipient 已收到 $amount';
  }

  @override
  String get section_misc => 'Miscellaneous strings';

  @override
  String get hintTitle => '提示';

  @override
  String get hintSubtitle => '此页面为支付演示，不连接真实支付渠道。';

  @override
  String get noData => '暂无数据';

  @override
  String get method => '支付方式';

  @override
  String get section_navigation => 'Navigation strings';

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
  String get toggleLang => 'EN';

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
