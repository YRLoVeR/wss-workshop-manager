import 'package:flutter/material.dart';
import 'package:wss_workshop_manager/screens/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Equipment Manager',
      debugShowCheckedModeBanner: false,
      home: const CatalogScreen(),
    );
  }
}
