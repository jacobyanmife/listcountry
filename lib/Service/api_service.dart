import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:listcountry/Service/constant.dart';
import 'package:listcountry/model/countrymodel.dart';

class ApiService {
  Future<List<Country>?> getCountry() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        List<Country> countries = [];
        jsonDecode(response.body).forEach((element) {
          try {
            countries.add(Country.fromJson(element));
          } catch (e) {
            log(e.toString());
          }
        });
        print(countries.length);
        return countries;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
