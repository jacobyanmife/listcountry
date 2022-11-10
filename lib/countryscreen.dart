import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset('assets/logo1.png'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mode_night_outlined))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
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
                  // ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, int index) {
                  //       return ListTile();
                  //     })
                ],
              ))),
    );
  }
}
