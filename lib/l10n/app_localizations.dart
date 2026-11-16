import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// Intro screen welcome description
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بك في أكون ! سأكون معلمك ومساعدك في رحلتك للتعلم وتصبح بطلاً في القراءة'**
  String get introText;

  /// Next button in intro
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get introTextBtn;

  /// Splash tagline
  ///
  /// In ar, this message translates to:
  /// **'أكون ... بالقراءة أكون'**
  String get splashBodyTxt;

  /// Splash start button
  ///
  /// In ar, this message translates to:
  /// **'ابدأ المغامرة'**
  String get splashBtnTxt;

  /// Sign up button
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get chooseSignUp;

  /// Sign in button
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get chooseSignIn;

  /// Login header
  ///
  /// In ar, this message translates to:
  /// **'!أهلاً بك في أكون'**
  String get loginHeader;

  /// Login subtitle
  ///
  /// In ar, this message translates to:
  /// **'لنبدأ مغامرة القراءة الممتعة'**
  String get loginSubHeader;

  /// Hero name title
  ///
  /// In ar, this message translates to:
  /// **'اسم البطل'**
  String get loginHeroNameTitle;

  /// Hero name hint
  ///
  /// In ar, this message translates to:
  /// **'ما اسمك؟'**
  String get loginHeroNameHint;

  /// Parents section title
  ///
  /// In ar, this message translates to:
  /// **'قسم الوالدين'**
  String get loginParentsSectionTitle;

  /// Email input hint
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get loginEmailHint;

  /// Phone input hint
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get loginPhoneHint;

  /// Start button
  ///
  /// In ar, this message translates to:
  /// **'هيا بنا ، نبدأ'**
  String get loginStartButton;

  /// Child name field title
  ///
  /// In ar, this message translates to:
  /// **'اسم الطفل'**
  String get registerChildNameTitle;

  /// Child name input hint
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الطفل'**
  String get registerHeroNameHint;

  /// Child age title
  ///
  /// In ar, this message translates to:
  /// **'العمر'**
  String get registerAgeTitle;

  /// Child age input hint
  ///
  /// In ar, this message translates to:
  /// **'كم عمرك؟'**
  String get registerAgeHint;

  /// Gender section title
  ///
  /// In ar, this message translates to:
  /// **'النوع'**
  String get registerGenderTitle;

  /// Boy gender option
  ///
  /// In ar, this message translates to:
  /// **'ولد'**
  String get registerGenderBoy;

  /// Girl gender option
  ///
  /// In ar, this message translates to:
  /// **'بنت'**
  String get registerGenderGirl;

  /// Wave data section title
  ///
  /// In ar, this message translates to:
  /// **'بيانات الموجة'**
  String get registerWaveDataTitle;

  /// Wave data section subtitle
  ///
  /// In ar, this message translates to:
  /// **'اختر من يسجل بياناتك التعليمية'**
  String get registerWaveDataSubtitle;

  /// Male teacher option
  ///
  /// In ar, this message translates to:
  /// **'معلم'**
  String get registerTeacherMale;

  /// Female teacher option
  ///
  /// In ar, this message translates to:
  /// **'معلمة'**
  String get registerTeacherFemale;

  /// Male descriptor
  ///
  /// In ar, this message translates to:
  /// **'ذكر'**
  String get registerMaleGender;

  /// Female descriptor
  ///
  /// In ar, this message translates to:
  /// **'أنثى'**
  String get registerFemaleGender;

  /// Language selection title
  ///
  /// In ar, this message translates to:
  /// **'اختر لغتك'**
  String get registerLanguageTitle;

  /// English language name
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get registerLanguageEnglish;

  /// Arabic language name
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get registerLanguageArabic;

  /// Urdu language name
  ///
  /// In ar, this message translates to:
  /// **'اردو'**
  String get registerLanguageUrdu;

  /// Turkish language name
  ///
  /// In ar, this message translates to:
  /// **'Türkçe'**
  String get registerLanguageTurkish;

  /// Dialect selection title
  ///
  /// In ar, this message translates to:
  /// **'اختر اللهجة المفضلة'**
  String get registerDialectTitle;

  /// Fusha dialect
  ///
  /// In ar, this message translates to:
  /// **'فصحى'**
  String get registerDialectFusha;

  /// Egyptian dialect
  ///
  /// In ar, this message translates to:
  /// **'مصري'**
  String get registerDialectEgyptian;

  /// Gulf dialect
  ///
  /// In ar, this message translates to:
  /// **'خليجي'**
  String get registerDialectGulf;

  /// Island header greeting
  ///
  /// In ar, this message translates to:
  /// **'صباح الخير يا عمر !'**
  String get islandGoodMorning;

  /// Island header subtitle
  ///
  /// In ar, this message translates to:
  /// **'هيا نكمل رحلتنا التعليمية'**
  String get islandContinueJourney;

  /// Letters island title
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الحروف'**
  String get islandLetters;

  /// Movements island title
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الحركات'**
  String get islandMovements;

  /// Madd island title
  ///
  /// In ar, this message translates to:
  /// **'جزيرة حروف المد'**
  String get islandMadd;

  /// Words island title
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الكلمات'**
  String get islandWords;

  /// Grammar island title
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الجمل والقواعد'**
  String get islandGrammar;

  /// Grand treasure title
  ///
  /// In ar, this message translates to:
  /// **'الكنز الكبير'**
  String get islandTreasure;

  /// Continue action button
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueText;

  /// Learn letter screen title
  ///
  /// In ar, this message translates to:
  /// **'تعلم الحرف'**
  String get learnLetter;

  /// Remember screen title
  ///
  /// In ar, this message translates to:
  /// **'تذكر'**
  String get rememberTitle;

  /// OK action button
  ///
  /// In ar, this message translates to:
  /// **'حسنا'**
  String get okText;

  /// Pronunciation training title
  ///
  /// In ar, this message translates to:
  /// **'تدريب النطق'**
  String get pronunciationTitle;

  /// Pronunciation evaluation subtitle
  ///
  /// In ar, this message translates to:
  /// **'هيا لنقييم النطق'**
  String get evaluatePronunciation;

  /// Listening training screen title
  ///
  /// In ar, this message translates to:
  /// **'تدريب الاستماع'**
  String get listeningTitle;

  /// Listening training subtitle
  ///
  /// In ar, this message translates to:
  /// **'استمع ثم اختر الحرف الصحيح'**
  String get listeningSubtitle;

  /// Feedback encouraging child to listen
  ///
  /// In ar, this message translates to:
  /// **'استمع لصوت الحرف بالضغط على مكبر الصوت'**
  String get listeningListenPrompt;

  /// Congratulatory message on correct letter pick
  ///
  /// In ar, this message translates to:
  /// **'أحسنت يا بطل! إجابة صحيحة 🌟'**
  String get listeningCorrectAnswer;

  /// Encouraging message on wrong letter pick
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى! استمع جيداً للصوت 🤔'**
  String get listeningWrongAnswer;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
