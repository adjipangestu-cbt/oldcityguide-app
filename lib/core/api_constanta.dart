class ApiConstanta {
  static final String domain = "https://oldcityguideapp.my.id";
  static final String baseUrl = "$domain/api";

  static Uri _getUrls(String endpoint, int? id) {
    final endpointUrl = "$baseUrl/$endpoint";
    if (id == null) return Uri.parse(endpointUrl);
    return Uri.parse("$endpointUrl/$id");
  }

  static Uri destinations({int? id}) => _getUrls('destinations', id);
  static Uri vacations({int? id}) => _getUrls("tourist-destinations", id);
  static Uri transportationGuide({int? id}) =>
      _getUrls("transportation-guides", id);
  static Uri videos({int? id}) => _getUrls('videos', id);
  static Uri vr({int? id}) => _getUrls('virtual-realities', id);
  static Uri histories({int? id}) => _getUrls('histories', id);
  static Uri cultures({int? id}) => _getUrls('cultural-blends', id);
  static Uri culinaries({int? id}) => _getUrls('culinary-places', id);
  static Uri tourRutesMaps({int? id}) => _getUrls('tour-routes', id);
  static Uri teamMembers({int? id}) => _getUrls('team-members', id);
}
