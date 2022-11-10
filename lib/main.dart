import 'package:flutter/material.dart';
import 'package:listcountry/countryscreen.dart';

void main() {
  runApp(const MyApp());
}
final darkNotifier = ValueNotifier<bool>(false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder <bool>(
    valueListenable: darkNotifier, 
    builder: (BuildContext context, bool isDark, Widget? child) {
      return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark(),
      home: const CountryScreen(),
    );
    });
    
  }
}
