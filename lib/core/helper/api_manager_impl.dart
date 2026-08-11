import 'dart:convert';

import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:http/http.dart' as http;

class ApiManagerImpl implements ApiManager {
  @override
  Future<dynamic> getData(Uri uri) async {
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw "Unexpected Error! Error ${response.statusCode}";
    }
    return json.decode(response.body);
  }
}
