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

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @error_title.
  ///
  /// In en, this message translates to:
  /// **'Sorry'**
  String get error_title;

  /// No description provided for @attack_type_melee.
  ///
  /// In en, this message translates to:
  /// **'Melee'**
  String get attack_type_melee;

  /// No description provided for @attack_type_ranged.
  ///
  /// In en, this message translates to:
  /// **'Ranged'**
  String get attack_type_ranged;

  /// No description provided for @attribute_str.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get attribute_str;

  /// No description provided for @attribute_agi.
  ///
  /// In en, this message translates to:
  /// **'Agility'**
  String get attribute_agi;

  /// No description provided for @attribute_int.
  ///
  /// In en, this message translates to:
  /// **'Intelligence'**
  String get attribute_int;

  /// No description provided for @attribute_universal.
  ///
  /// In en, this message translates to:
  /// **'universal'**
  String get attribute_universal;

  /// No description provided for @role_carry.
  ///
  /// In en, this message translates to:
  /// **'Carry'**
  String get role_carry;

  /// No description provided for @role_support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get role_support;

  /// No description provided for @role_nuker.
  ///
  /// In en, this message translates to:
  /// **'Nuker'**
  String get role_nuker;

  /// No description provided for @role_disabler.
  ///
  /// In en, this message translates to:
  /// **'Disabler'**
  String get role_disabler;

  /// No description provided for @role_jungler.
  ///
  /// In en, this message translates to:
  /// **'Jungler'**
  String get role_jungler;

  /// No description provided for @role_durable.
  ///
  /// In en, this message translates to:
  /// **'Durable'**
  String get role_durable;

  /// No description provided for @role_escape.
  ///
  /// In en, this message translates to:
  /// **'Escape'**
  String get role_escape;

  /// No description provided for @role_pusher.
  ///
  /// In en, this message translates to:
  /// **'Pusher'**
  String get role_pusher;

  /// No description provided for @role_initiator.
  ///
  /// In en, this message translates to:
  /// **'Initiator'**
  String get role_initiator;
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
