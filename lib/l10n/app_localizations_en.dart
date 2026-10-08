// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'OldCityGuide App';

  @override
  String get welcomeGreeting => 'Hello, welcome\nto the app\n';

  @override
  String get welcomeAppName => 'OldCityGuide ';

  @override
  String get welcomeAppSuffix => 'App';

  @override
  String get menuDigitalMap => 'Digital Map';

  @override
  String get menuGeography => 'Geography';

  @override
  String get menuDestination => 'Tourist Destinations';

  @override
  String get menuVirtualReality => 'Virtual Reality';

  @override
  String get menuCafeCulinary => 'Cafe & Culinary';

  @override
  String get menuHistory => 'History';

  @override
  String get menuVideo => 'Video';

  @override
  String get menuCulture => 'Cultural Exchange';

  @override
  String get navHome => 'Home';

  @override
  String get navVacation => 'Vacation';

  @override
  String get navVr => 'VR';

  @override
  String get navVideo => 'Video';

  @override
  String get navInformation => 'Information';

  @override
  String get sectionKnowMore => 'Discover more about this historic city';

  @override
  String get cardHistoryTitle => 'History';

  @override
  String get cardHistoryDesc => 'Learn about the history of cities around you';

  @override
  String get cardDestinationTitle => 'Tourist Destinations';

  @override
  String get cardDestinationDesc => 'Explore a variety of tourist destinations';

  @override
  String get cardCulinaryTitle => 'Culinary & Cafe';

  @override
  String get cardCulinaryDesc =>
      'Take a break and enjoy culinary and cafe recommendations';

  @override
  String get vrImmersiveTitle => 'Immersive Experience';

  @override
  String get vrImmersiveDesc =>
      'Explore historical places in the virtual world, for an unforgettable experience';

  @override
  String get vrStartNow => 'Start now';

  @override
  String get vrTitle => 'Virtual Reality of Historical Places in Lasem';

  @override
  String get geographyTitle => 'Geography';

  @override
  String get geographyAppbarTitle => 'Lasem Geography';

  @override
  String geographyAppbarDetail(String title) {
    return 'Geography $title';
  }

  @override
  String get languageToggleTooltip => 'Switch Language';

  @override
  String get aboutUsTitle => 'About Us';

  @override
  String get aboutUsTeam => 'Team';

  @override
  String get cultureTitle => 'Cultural Exchange';

  @override
  String get cultureSearchHint => 'Search culture';

  @override
  String get cultureDetailDefaultTitle => 'Title';

  @override
  String get digitalMapTitle => 'Digital Map';

  @override
  String get culinaryTitle => 'Culinary & Cafe';

  @override
  String get culinarySearchHint => 'Culinary & Cafe';

  @override
  String get culinaryImageFailed => 'Image failed to load!';

  @override
  String get historyTitle => 'History';

  @override
  String get historySearchHint => 'Search history';

  @override
  String get historyDetailDefaultTitle => 'Title';

  @override
  String get historyLocationLabel => 'Location';

  @override
  String get vacationSearchHint => 'Search tourist destinations';

  @override
  String get videoSearchHint => 'Search video';

  @override
  String get infoMenuLabel => 'Menu';

  @override
  String get infoAboutUs => 'About us';

  @override
  String get destinationLabel => 'Destination';

  @override
  String get noDataMessage => 'No data found';

  @override
  String get errorRetry => 'Retry';

  @override
  String get connectionOffline => 'No internet connection!';

  @override
  String get connectionOnline => 'You are back online!';

  @override
  String get menuKampungHeritage => 'Heritage Village';
}
