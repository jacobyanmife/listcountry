import 'package:flutter/material.dart';
import 'package:listcountry/model/countrymodel.dart';

class Screen2 extends StatefulWidget {
  const Screen2(this.country, {Key? key}) : super(key: key);
  final Country country;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.country.name?.official ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Image.network(widget.country.flags?.png ?? ''),
          SizedBox(height: 10),
          details(
              'Capital Info:', (widget.country.capitalInfo?.toString() ?? '')),
          details('population:', (widget.country.population?.toString() ?? '')),
          details('Region:', (widget.country.region?.toString() ?? '')),
          details('Capital:', (widget.country.capital?.toString() ?? '')),
          SizedBox(height: 15),
          details('Continent:', (widget.country.continents?.toString() ?? '')),
          details('Official Language:',
              (widget.country.languages?.toString() ?? '')),
          details('Subregion:', (widget.country.subregion?.toString() ?? '')),
          details(
              'Independence:', (widget.country.independent?.toString() ?? '')),
          details('Area:', (widget.country.area?.toString() ?? '')),
          details('Currency:', (widget.country.currencies?.toString() ?? '')),
          SizedBox(height: 15),
          details('Government:', (widget.country.unMember?.toString() ?? '')),
          details(
              'Coat of Arm:', (widget.country.coatOfArms?.toString() ?? '')),
          details('car:', (widget.country.car?.toString() ?? '')),
        ]),
      ),
    );
  }
}

Widget details(String detail, String link) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            detail,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          Text(
            link,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      )
    ],
  );
}
