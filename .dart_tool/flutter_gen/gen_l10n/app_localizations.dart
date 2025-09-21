import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// Uygulamanın başlığı
  ///
  /// In tr, this message translates to:
  /// **'Mocci'**
  String get appTitle;

  /// Bilgi ekranı başlığı
  ///
  /// In tr, this message translates to:
  /// **'Bilgilerinizi Girin'**
  String get enterYourInformation;

  /// Ad soyad alanı etiketi
  ///
  /// In tr, this message translates to:
  /// **'Ad Soyad'**
  String get nameSurname;

  /// Yaş alanı etiketi
  ///
  /// In tr, this message translates to:
  /// **'Yaş'**
  String get age;

  /// Boy alanı etiketi
  ///
  /// In tr, this message translates to:
  /// **'Boy (cm)'**
  String get height;

  /// Kilo alanı etiketi
  ///
  /// In tr, this message translates to:
  /// **'Kilo (kg)'**
  String get weight;

  /// Erkek cinsiyet seçeneği
  ///
  /// In tr, this message translates to:
  /// **'Erkek'**
  String get male;

  /// Kadın cinsiyet seçeneği
  ///
  /// In tr, this message translates to:
  /// **'Kadın'**
  String get female;

  /// Kronik hastalıklar bölüm başlığı
  ///
  /// In tr, this message translates to:
  /// **'Kronik Hastalıklar'**
  String get chronicDiseases;

  /// İleri butonu
  ///
  /// In tr, this message translates to:
  /// **'İLERİ'**
  String get next;

  /// Aile geçmişi ekranı başlığı
  ///
  /// In tr, this message translates to:
  /// **'Aile Geçmişi'**
  String get familyHistory;

  /// Aile geçmişi ekleme bölümü
  ///
  /// In tr, this message translates to:
  /// **'Aile Geçmişi Ekle'**
  String get addFamilyHistory;

  /// Sonuçlar ekranı başlığı
  ///
  /// In tr, this message translates to:
  /// **'Sonuçlar'**
  String get results;

  /// Önerilen testler başlığı
  ///
  /// In tr, this message translates to:
  /// **'Önerilen Testler:'**
  String get recommendedTests;

  /// Diyabet hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Diyabet'**
  String get diabetes;

  /// Tansiyon hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Hipertansiyon'**
  String get hypertension;

  /// Koroner kalp hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Koroner Kalp Hastalığı'**
  String get coronaryHeartDisease;

  /// İnflamatuar bağırsak hastalığı
  ///
  /// In tr, this message translates to:
  /// **'İnflamatuar Bağırsak Hastalığı'**
  String get inflammatoryBowelDisease;

  /// Hipotroid hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Hipotroid'**
  String get hypothyroid;

  /// Hipertroid hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Hipertroid'**
  String get hyperthyroid;

  /// KOAH hastalığı
  ///
  /// In tr, this message translates to:
  /// **'KOAH'**
  String get copd;

  /// Böbrek yetmezliği hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Böbrek Yetmezliği'**
  String get kidneyFailure;

  /// Siroz hastalığı
  ///
  /// In tr, this message translates to:
  /// **'Siroz'**
  String get cirrhosis;

  /// Kolorektal kanser
  ///
  /// In tr, this message translates to:
  /// **'Kolorektal Kanser'**
  String get colorectalCancer;

  /// Meme kanseri
  ///
  /// In tr, this message translates to:
  /// **'Meme Kanseri'**
  String get breastCancer;

  /// Prostat kanseri
  ///
  /// In tr, this message translates to:
  /// **'Prostat Kanseri'**
  String get prostateCancer;

  /// Diyabet test önerisi
  ///
  /// In tr, this message translates to:
  /// **'Diyabet için Üç Aylık Test'**
  String get quarterlyTestForDiabetes;

  /// Koroner kalp hastalığı test önerisi
  ///
  /// In tr, this message translates to:
  /// **'Koroner Kalp Hastalığı için Yıllık Test'**
  String get yearlyTestForCoronaryHeartDisease;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
