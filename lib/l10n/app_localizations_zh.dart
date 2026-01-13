// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get section_welcome => '欢迎页面文本';

  @override
  String get appTitle => 'mBrics 平台';

  @override
  String get welcomeTitle => '欢迎来到 mBrics';

  @override
  String get welcome => '欢迎来到 mBrics';

  @override
  String get section_login => '登录页面文本';

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
  String get globalTradeSlogan => '全球贸易，由区块链保障';

  @override
  String get loginSubtitle => '为全球贸易而建，为信任而设计。';

  @override
  String get alreadyHaveAccount => '已有账户？登录';

  @override
  String get goToLogin => '已有账户？登录';

  @override
  String get noAccountRegister => '没有账户？立即注册';

  @override
  String get alreadyRegisteredLogin => '已注册？登录';

  @override
  String get createAccount => '创建账户';

  @override
  String get alreadyRegistered => '已注册？登录';

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
  String get section_errors => '错误信息';

  @override
  String get errorInvalidCredentials => '邮箱或密码错误，请重试。';

  @override
  String get errorUserNotFound => '该邮箱没有账户。是否要注册？';

  @override
  String get errorEmailTaken => '该邮箱已注册，请尝试登录。';

  @override
  String get errorWeakPassword => '密码至少需要 8 个字符。';

  @override
  String get errorNetwork => '无法连接服务器，请检查网络后重试。';

  @override
  String get errorTooManyAttempts => '登录失败次数过多，请稍后再试。';

  @override
  String get errorUnexpected => '出现错误，请稍后再试。';

  @override
  String get errorInvalidEmailFormat => '请输入有效的邮箱地址。';

  @override
  String get errorInvalidPhone => '请输入有效的电话号码。';

  @override
  String get section_registration => '注册页面文本';

  @override
  String get errorNameRequired => '姓名为必填项';

  @override
  String get errorEmailRequired => '邮箱为必填项';

  @override
  String get errorPasswordRequired => '密码为必填项';

  @override
  String get passwordHelper => '密码至少需要 8 个字符';

  @override
  String get countryLabel => '国家';

  @override
  String get countrySouthAfrica => '南非';

  @override
  String get countryChina => '中国';

  @override
  String get countryOther => '其他';

  @override
  String get countryCodeHint => '国家代码（例如 +44）';

  @override
  String get registrationSlogan => '为全球贸易而建，为信任而设计。';

  @override
  String get registrationFeature1Title => '安全身份';

  @override
  String get registrationFeature1Line1 => '您的信息端到端加密。';

  @override
  String get registrationFeature1Line2 => '无泄露，无妥协。';

  @override
  String get registrationFeature2Title => '全球合规';

  @override
  String get registrationFeature2Line1 => '符合国际 KYC/AML 标准。';

  @override
  String get registrationFeature2Line2 => '获得全球监管机构信任。';

  @override
  String get registrationFeature3Title => '即时验证';

  @override
  String get registrationFeature3Line1 => '账户秒级验证。';

  @override
  String get registrationFeature3Line2 => '无需等待，无延迟。';

  @override
  String get registrationFeature4Title => '智能合约支持';

  @override
  String get registrationFeature4Line1 => '面向未来的注册流程。';

  @override
  String get registrationFeature4Line2 => '无缝集成区块链托管。';

  @override
  String get registrationFeature5Title => '跨境友好';

  @override
  String get registrationFeature5Line1 => '一次注册，全球交易。';

  @override
  String get registrationFeature5Line2 => '支持多币种和地区。';

  @override
  String get registrationFeature6Title => '审计透明';

  @override
  String get registrationFeature6Line1 => '每次注册均不可篡改记录。';

  @override
  String get registrationFeature6Line2 => '为合作伙伴和投资者提供信任证明。';

  @override
  String get registrationSuccess => '账户创建成功。请验证邮箱并登录。';

  @override
  String registrationFailed(String error) {
    return '注册失败：$error';
  }

  @override
  String get section_login_features => '登录页面功能亮点';

  @override
  String get feature1Title => '本币交易';

  @override
  String get feature1Line1 => '实时报价支持兰特、人民币等。';

  @override
  String get feature1Line2 => '透明落地成本，无隐藏转换。';

  @override
  String get feature2Title => '即时国际转账';

  @override
  String get feature2Line1 => '即时本币跨境转账。';

  @override
  String get feature2Line2 => '由央行保障安全。';

  @override
  String get feature3Title => '区块链托管监管';

  @override
  String get feature3Line1 => '智能合约自动执行信任。';

  @override
  String get feature3Line2 => '所有交易由区块链监督。';

  @override
  String get feature4Title => '可信物流';

  @override
  String get feature4Line1 => '全球 500 强提供交付。';

  @override
  String get feature4Line2 => '国有承运人确保可靠性。';

  @override
  String get feature5Title => '监管与安全';

  @override
  String get feature5Line1 => '由中国银行监管。';

  @override
  String get feature5Line2 => '全球贸易的守护者。';

  @override
  String get feature6Title => '无需昂贵信用证';

  @override
  String get feature6Line1 => '替代缓慢的信用证。';

  @override
  String get feature6Line2 => '即时协议，无需纸质文件。';

  @override
  String get section_ddp => 'DDP 平台文本';

  @override
  String get ddp => 'DDP 平台';

  @override
  String get ddp_subtitle => '透明的落地成本报价';

  @override
  String get originCountry => '起始国家';

  @override
  String get destinationCountry => '目的国家';

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
  String get section_forex => '外汇文本';

  @override
  String get forex => '外汇汇率';

  @override
  String get forex_subtitle => '美元、人民币、兰特';

  @override
  String get usdToCny => '美元兑人民币';

  @override
  String get usdToZar => '美元兑兰特';

  @override
  String get cnyToZar => '人民币兑兰特';

  @override
  String get currency => '货币';

  @override
  String get amount => '金额';

  @override
  String get convertedAmount => '转换金额';

  @override
  String get section_escrow => '托管文本';

  @override
  String get escrow => '创建托管合约';

  @override
  String get escrowTitle => '托管';

  @override
  String get section_pay => '支付文本';

  @override
  String get pay => '支付';

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
    return '支付演示：$recipient 已收到 $amount';
  }

  @override
  String get section_misc => '其他文本';

  @override
  String get hintTitle => '提示';

  @override
  String get hintSubtitle => '此页面为支付演示，未连接真实支付渠道。';

  @override
  String get noData => '无数据';

  @override
  String get method => '支付方式';

  @override
  String get section_navigation => '导航文本';

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
  String get toggleLang => '切换语言';

  @override
  String get terms => '条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get editProfile => '编辑资料';

  @override
  String footerText(String year) {
    return '@ $year mBrics';
  }
}
