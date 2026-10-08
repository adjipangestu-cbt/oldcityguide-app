import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

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
    Locale('en'),
    Locale('id')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'OldCityGuide App'**
  String get appTitle;

  /// Welcome greeting on home screen
  ///
  /// In en, this message translates to:
  /// **'Hello, welcome\nto the app\n'**
  String get welcomeGreeting;

  /// App brand name in welcome message
  ///
  /// In en, this message translates to:
  /// **'OldCityGuide '**
  String get welcomeAppName;

  /// Suffix after app name
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get welcomeAppSuffix;

  /// Digital map menu item
  ///
  /// In en, this message translates to:
  /// **'Digital Map'**
  String get menuDigitalMap;

  /// Geography menu item
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get menuGeography;

  /// Tourist destinations menu item
  ///
  /// In en, this message translates to:
  /// **'Tourist Destinations'**
  String get menuDestination;

  /// VR menu item
  ///
  /// In en, this message translates to:
  /// **'Virtual Reality'**
  String get menuVirtualReality;

  /// Cafe and culinary menu item
  ///
  /// In en, this message translates to:
  /// **'Cafe & Culinary'**
  String get menuCafeCulinary;

  /// History menu item
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get menuHistory;

  /// Video menu item
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get menuVideo;

  /// Cultural exchange menu item
  ///
  /// In en, this message translates to:
  /// **'Cultural Exchange'**
  String get menuCulture;

  /// Bottom nav home label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom nav vacation label
  ///
  /// In en, this message translates to:
  /// **'Vacation'**
  String get navVacation;

  /// Bottom nav VR label
  ///
  /// In en, this message translates to:
  /// **'VR'**
  String get navVr;

  /// Bottom nav video label
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get navVideo;

  /// Bottom nav information label
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get navInformation;

  /// Section header on home screen
  ///
  /// In en, this message translates to:
  /// **'Discover more about this historic city'**
  String get sectionKnowMore;

  /// History card title
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get cardHistoryTitle;

  /// History card description
  ///
  /// In en, this message translates to:
  /// **'Learn about the history of cities around you'**
  String get cardHistoryDesc;

  /// Destination card title
  ///
  /// In en, this message translates to:
  /// **'Tourist Destinations'**
  String get cardDestinationTitle;

  /// Destination card description
  ///
  /// In en, this message translates to:
  /// **'Explore a variety of tourist destinations'**
  String get cardDestinationDesc;

  /// Culinary card title
  ///
  /// In en, this message translates to:
  /// **'Culinary & Cafe'**
  String get cardCulinaryTitle;

  /// Culinary card description
  ///
  /// In en, this message translates to:
  /// **'Take a break and enjoy culinary and cafe recommendations'**
  String get cardCulinaryDesc;

  /// VR banner title
  ///
  /// In en, this message translates to:
  /// **'Immersive Experience'**
  String get vrImmersiveTitle;

  /// VR banner description
  ///
  /// In en, this message translates to:
  /// **'Explore historical places in the virtual world, for an unforgettable experience'**
  String get vrImmersiveDesc;

  /// VR banner button text
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get vrStartNow;

  /// VR screen page title
  ///
  /// In en, this message translates to:
  /// **'Virtual Reality of Historical Places in Lasem'**
  String get vrTitle;

  /// Geography section title
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get geographyTitle;

  /// Geography screen appbar
  ///
  /// In en, this message translates to:
  /// **'Lasem Geography'**
  String get geographyAppbarTitle;

  /// Geography detail screen appbar with dynamic name
  ///
  /// In en, this message translates to:
  /// **'Geography {title}'**
  String geographyAppbarDetail(String title);

  /// Language toggle button tooltip
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get languageToggleTooltip;

  /// About us screen title
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUsTitle;

  /// Team section label
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get aboutUsTeam;

  /// Culture screen title
  ///
  /// In en, this message translates to:
  /// **'Cultural Exchange'**
  String get cultureTitle;

  /// Culture search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search culture'**
  String get cultureSearchHint;

  /// Default title for culture detail
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get cultureDetailDefaultTitle;

  /// Digital map screen title
  ///
  /// In en, this message translates to:
  /// **'Digital Map'**
  String get digitalMapTitle;

  /// Culinary screen title
  ///
  /// In en, this message translates to:
  /// **'Culinary & Cafe'**
  String get culinaryTitle;

  /// Culinary search placeholder
  ///
  /// In en, this message translates to:
  /// **'Culinary & Cafe'**
  String get culinarySearchHint;

  /// Image loading error message
  ///
  /// In en, this message translates to:
  /// **'Image failed to load!'**
  String get culinaryImageFailed;

  /// History screen title
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// History search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search history'**
  String get historySearchHint;

  /// Default title for history detail
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get historyDetailDefaultTitle;

  /// Location label on history detail
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get historyLocationLabel;

  /// Vacation search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search tourist destinations'**
  String get vacationSearchHint;

  /// Video search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search video'**
  String get videoSearchHint;

  /// Information screen menu label
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get infoMenuLabel;

  /// About us menu item text
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get infoAboutUs;

  /// Destination picker label
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destinationLabel;

  /// No data found message
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get noDataMessage;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get errorRetry;

  /// Offline status message
  ///
  /// In en, this message translates to:
  /// **'No internet connection!'**
  String get connectionOffline;

  /// Online status message
  ///
  /// In en, this message translates to:
  /// **'You are back online!'**
  String get connectionOnline;

  /// Kampung Heritage Kayutangan menu label
  ///
  /// In en, this message translates to:
  /// **'Heritage Village'**
  String get menuKampungHeritage;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
