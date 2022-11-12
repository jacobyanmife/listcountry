import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Country'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Image.asset('assets/country.jpg'),
            SizedBox(height: 10),
            details('population:', ''),
            details('Region:', ''),
            details('Capital:', ''),
            details('Motto:', ''),
            SizedBox(height: 15),
            details('Official Language:', ''),
            details('Ethnic group:', ''),
            details('Religion:', ''),
            details('Government:', ''),
            SizedBox(height: 15),
            details('Independence:', ''),
            details('Area:', ''),
            details('Currency:', ''),
            details('GDP:', ''),
            SizedBox(height: 15),
            details('Timezone:', ''),
            details('Date format:', ''),
            details('Dialing Code:', ''),
            details('Driving Side:', ''),
          ]),
        ),
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
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(link),
        ],
      )
    ],
  );
}
