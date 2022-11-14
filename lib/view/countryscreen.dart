import 'package:flutter/material.dart';
import 'package:listcountry/Service/api_service.dart';
import 'package:listcountry/model/countrymodel.dart';
import 'package:listcountry/view/Screen2.dart';
import '../main.dart';

import 'country_details.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late List<Country>? country = [];
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    country = (await ApiService().getCountry());
    print(country);
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void dispose() {
    // TODO: implement dispose
    darkNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(country?.length);
    bool isDark = darkNotifier.value;
    bool isSelected = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                    width: 120,
                    child: isDark == true
                        ? Image.asset('assets/logo.png')
                        : Image.asset('assets/logo1.png')),
                Spacer(),
                IconButton(
                  onPressed: () {
                    isDark = !isDark;
                    darkNotifier.value = isDark;
                  },
                  icon: isSelected == true
                      ? Icon(Icons.bedtime_sharp)
                      : Icon(Icons.wb_sunny),
                ),
              ]),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search Country',
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 42,
                    width: 75,
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.language_outlined)),
                          Text(
                            'EN',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 42,
                    width: 85,
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.filter_alt_outlined)),
                            Text(
                              'Filter',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: country?.length ?? 0,
                  itemBuilder: (context, int index) {
                    Country item = country![index];
                    return ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Screen2(item)));
                      },
                      title: (Text(
                        item.name?.common ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'Roboto'),
                      )),
                      subtitle: (Text(
                          item.capital!.isNotEmpty ? item.capital!.first : "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              fontFamily: 'Roboto'))),
                      leading: Image.network(
                        item.flags!.png ?? "",
                        height: 50,
                        width: 120,
                        fit: BoxFit.cover,
                      ), // try Cached Network Image
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
