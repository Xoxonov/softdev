import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/consent/FavoriteModel.dart';
import 'package:recipe/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteModel(),
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}