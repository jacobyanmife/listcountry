import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:listcountry/Service/constant.dart';
import 'package:listcountry/model/countrymodel.dart';

class ApiService {
  Future<List<Country>?> getCountry() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Country> _model = countryFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
