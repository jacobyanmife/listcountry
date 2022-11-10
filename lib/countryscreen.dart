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
                  ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search Country',
                      ),
                    ),
                  ),
                  ListView.builder( itemCount: 5, itemBuilder: (context, int index)  {
                    return ListTile();
                  })
                ],
              ))),
    );
  }
}
