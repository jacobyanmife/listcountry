import 'package:flutter/material.dart';
import 'package:listcountry/Service/api_service.dart';
import 'package:listcountry/model/countrymodel.dart';
import 'package:listcountry/view/Screen2.dart';
import '../main.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<Country> filtered = [];
  late List<Country>? rawList = [];
  bool isSelected = false;

  String? filter;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    rawList = (await ApiService().getCountry());
    if (rawList == null) return;
    rawList!.sort(
        (a, b) => (a.name?.official ?? '').compareTo(b.name?.official ?? ''));
    rawList?.forEach((element) {
      continents.addAll(element.continents ?? []);
    });
    continents = continents.toSet().toList();
    filtered.addAll(rawList!);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  List<String> continents = [];

  void dispose() {
    // TODO: implement dispose
    darkNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(filtered?.length);
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
                        ? Image.asset('assets/logo1.png')
                        : Image.asset('assets/logo.png')),
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
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search Country',
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  ),
                  onChanged: (b) {
                    String a = b.trim();
                    if (a.isNotEmpty) {
                      if (rawList == null) return;
                      filtered.clear();
                      for (Country item in rawList!) {
                        if ((item.name?.official
                                    ?.toUpperCase()
                                    .contains(a.toUpperCase()) ??
                                true) &&
                            (item.continents?.contains(filter) ?? true)) {
                          filtered.add(item);
                        }
                      }
                    } else {
                      filtered.clear();
                      filtered.addAll(rawList!);
                    }
                    setState(() {});
                  },
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
                  if (filter != null)
                    Text(
                      filter!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  SizedBox(width: 6),
                  if (filter != null)
                    InkWell(
                      onTap: () {
                        filter = null;
                        filtered.clear();
                        filtered.addAll(rawList!);
                        setState(() {});
                      },
                      child: Icon(Icons.close, size: 18),
                    ),
                  SizedBox(width: 10),
                  PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onSelected: (String a) {
                        filter = a;
                        if (a.isNotEmpty) {
                          if (rawList == null) return;
                          filtered.clear();
                          for (Country item in rawList!) {
                            if ((item.continents?.contains(filter) ?? true)) {
                              filtered.add(item);
                            }
                          }
                        } else {
                          filtered.clear();
                          filtered.addAll(rawList!);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 42,
                        width: 85,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.filter_alt_outlined, size: 20),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemBuilder: (BuildContext context) => continents
                          .map(
                            (e) => PopupMenuItem<String>(
                              value: e,
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(e),
                                ],
                              ),
                            ),
                          )
                          .toList())
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered?.length ?? 0,
                  itemBuilder: (context, int index) {
                    Country item = filtered![index];
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
