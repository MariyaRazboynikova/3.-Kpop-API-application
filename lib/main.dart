import 'package:flutter/material.dart';
import 'package:kpop_application/core/themes/themes_provider.dart';
import 'package:kpop_application/presentaion/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemesProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: IntroPage(),
      ),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        // '/home_pages': (context) => HomePage(),
        // '/city_detail_page.dart': (context) => const CityDetailPage(
        //       cityName: '',
        //       stateName: '',
        //       countryName: '',
        //     ),
      },
    );
  }
}
