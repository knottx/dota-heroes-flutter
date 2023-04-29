import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
/// import 'generated/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en')
  ];

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Sorry'**
  String get errorTitle;

  /// No description provided for @attackTypeMelee.
  ///
  /// In en, this message translates to:
  /// **'Melee'**
  String get attackTypeMelee;

  /// No description provided for @attackTypeRanged.
  ///
  /// In en, this message translates to:
  /// **'Ranged'**
  String get attackTypeRanged;

  /// No description provided for @attributeStr.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get attributeStr;

  /// No description provided for @attributeAgi.
  ///
  /// In en, this message translates to:
  /// **'Agility'**
  String get attributeAgi;

  /// No description provided for @attributeInt.
  ///
  /// In en, this message translates to:
  /// **'Intelligence'**
  String get attributeInt;

  /// No description provided for @attributeUniversal.
  ///
  /// In en, this message translates to:
  /// **'universal'**
  String get attributeUniversal;

  /// No description provided for @roleCarry.
  ///
  /// In en, this message translates to:
  /// **'Carry'**
  String get roleCarry;

  /// No description provided for @roleSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get roleSupport;

  /// No description provided for @roleNuker.
  ///
  /// In en, this message translates to:
  /// **'Nuker'**
  String get roleNuker;

  /// No description provided for @roleDisabler.
  ///
  /// In en, this message translates to:
  /// **'Disabler'**
  String get roleDisabler;

  /// No description provided for @roleJungler.
  ///
  /// In en, this message translates to:
  /// **'Jungler'**
  String get roleJungler;

  /// No description provided for @roleDurable.
  ///
  /// In en, this message translates to:
  /// **'Durable'**
  String get roleDurable;

  /// No description provided for @roleEscape.
  ///
  /// In en, this message translates to:
  /// **'Escape'**
  String get roleEscape;

  /// No description provided for @rolePusher.
  ///
  /// In en, this message translates to:
  /// **'Pusher'**
  String get rolePusher;

  /// No description provided for @roleInitiator.
  ///
  /// In en, this message translates to:
  /// **'Initiator'**
  String get roleInitiator;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
