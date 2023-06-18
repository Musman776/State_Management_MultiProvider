import 'package:favoriteapp1_state_management/ExampleApp/provider/Example_provider.dart';
import 'package:favoriteapp1_state_management/FavoriteApp_Example/favorite_provider/FavoriteProvider.dart';
import 'package:favoriteapp1_state_management/FavoriteApp_Example/favorite_screen/FavoriteScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (_) => ExampleProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:const FavoriteScreen(),
    ));
  }
}

