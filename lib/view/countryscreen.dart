import 'package:flutter/material.dart';
import 'package:listcountry/Service/api_service.dart';
import 'package:listcountry/model/countrymodel.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late List<Country>? country = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    country = (await ApiService().getCountry())!;
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                        width: 120, child: Image.asset('assets/logo1.png')),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.mode_night_outlined))
                  ]),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: TextField(
                          decoration: InputDecoration(
                            labelText: 'Search Country',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.language_outlined)),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_alt_outlined)),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, int index) {
                          return ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              title: (Text(
                                'Country',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: 'Roboto'),
                              )),
                              subtitle: (Text('State',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'))),
                              leading: Image.asset('assets/country.jpg'));
                        }),
                  )
                ],
              ))),
    );
  }
}
