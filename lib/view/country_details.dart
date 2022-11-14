import 'package:flutter/material.dart';

import '../model/countrymodel.dart';
import '../main.dart';

class CountryDetails extends StatefulWidget {
  const CountryDetails(this.country, {Key? key}) : super(key: key);
  final Country country;

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  void dispose() {
    // TODO: implement dispose
    darkNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country.name?.official ?? ''),
      ),
      body: ListView(
        children: [
          Image.network(widget.country.flags?.png ?? ''),
          Text(widget.country.name?.official ?? ''),
          Text(widget.country.population?.toString() ?? ''),
          Text(widget.country.name?.official ?? ''),
        ],
      ),
    );
  }
}
