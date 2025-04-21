import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_items/item_model.dart';
import 'details/details_screen/details_page.dart';
import 'home/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ItemModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
