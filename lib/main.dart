import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:taskbygithub/home/home_page.dart';
import 'package:taskbygithub/theme/theme_mode.dart';
import 'package:taskbygithub/theme/theme_model.dart';
import 'package:taskbygithub/timer/timer_model.dart';
import 'add_items/item_model.dart';
import 'favorite/favorite_model.dart';
import 'home/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final itemModel = ItemModel();
  await itemModel.loadItemsFromDb();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) => ItemModel(),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => FavoriteModel(),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => TimerProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeModel()..getTheme())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeModel>(context).lightModel
          ? ModeTheme.darkMode
          : ModeTheme.lightMode,
      home: NavBar(),
    );
  }
}
