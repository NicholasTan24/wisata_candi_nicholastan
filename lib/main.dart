import 'package:flutter/material.dart';
import 'package:wisata_candi_nicholastan/data/candi_data.dart';
import 'package:wisata_candi_nicholastan/screens/detail_screen.dart';
import 'package:wisata_candi_nicholastan/screens/profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ProfileScreen(),
      home: DetailScreen(candi: candiList[0]),
    );
  }
}

